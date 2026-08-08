# Introduction

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
