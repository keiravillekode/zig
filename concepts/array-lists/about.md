# About

A slice has a fixed length. `std.ArrayList` is the growable version: a slice that reallocates itself as you add to it.

It starts empty and takes an allocator on every operation that might need memory:

```zig
const std = @import("std");

var playlist: std.ArrayList([]const u8) = .empty;
defer playlist.deinit(allocator);

try playlist.append(allocator, "Blue Monday");
```

`append` can fail, because growing means allocating, so it returns an error union.

`.items` is a slice of what is currently in the list, and everything you already know about slices applies to it:

```zig
playlist.items.len         // how many
playlist.items[0]          // the first
for (playlist.items) |track| { ... }
```

The other operations you will reach for most:

- `appendSlice(allocator, slice)` — add several at once
- `appendNTimes(allocator, value, n)` — add the same thing repeatedly
- `pop()` — remove and return the last item
- `clearRetainingCapacity()` — empty it without giving the memory back

When a function has finished building a list and wants to hand back a plain slice, `toOwnedSlice` does that and leaves the list empty. The caller then owns the slice and frees it, so there is no `deinit` left to do:

```zig
pub fn collect(allocator: std.mem.Allocator, tracks: []const []const u8) ![][]const u8 {
    var playlist: std.ArrayList([]const u8) = .empty;
    errdefer playlist.deinit(allocator);

    for (tracks) |track| try playlist.append(allocator, track);
    return playlist.toOwnedSlice(allocator);
}
```

## Why the allocator is passed every time

`std.ArrayList` is *unmanaged*: it stores a pointer, a length and a capacity, and nothing else. It does not keep hold of an allocator, so you hand one to each call that needs it.

That makes the list three words instead of five, lets a program store thousands of them without repeating the same allocator over and over, and — most usefully — makes it impossible to free with the wrong allocator by accident, because you can see which one is being used at every call site.

The cost is that you must pass the *same* allocator every time. Mixing them is undefined behaviour that no compiler check will catch.

## Capacity and growth

Appending to a full list allocates a bigger buffer, copies everything across, and frees the old one. The growth is geometric, so appending `n` items costs `O(n)` overall rather than `O(n²)`.

If you know roughly how many items are coming, say so up front and skip the intermediate copies:

```zig
var list = try std.ArrayList(u32).initCapacity(allocator, 1000);
defer list.deinit(allocator);
```

Once capacity is reserved, `appendAssumeCapacity` cannot fail and needs no `try`.

## `.items` is borrowed

The slice `.items` gives you points into the list's buffer. Append something and the buffer may move, leaving your slice pointing at freed memory. Treat `.items` as valid only until the next modification — take a copy if you need it to outlive one.

## `deinit` or `toOwnedSlice`, never both

A list either keeps its buffer, and you `deinit` it, or hands it over with `toOwnedSlice`, and you do not. `toOwnedSlice` leaves the list empty and valid, so a later `deinit` is harmless but redundant.

The `errdefer playlist.deinit(allocator)` in a function that ends with `toOwnedSlice` is the correct pairing: it fires only if something fails before the handover.

## Removing items

- `pop()` — the last item, `O(1)`, returns an [optional][optionals]
- `orderedRemove(i)` — keeps the order, shifts everything after it, `O(n)`
- `swapRemove(i)` — `O(1)`, but moves the last item into the gap

## Managed lists

`std.array_list.Managed(T)` is the older shape that stores its allocator, so `list.append(x)` takes no allocator. Some of the practice exercises on this track still use it. New code should prefer the unmanaged form.

[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals
