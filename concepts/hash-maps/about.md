# About

A hash map stores values under keys and finds them again without searching. Zig has two you will reach for constantly:

- `std.AutoHashMap(K, V)` — for keys the compiler can hash on its own: integers, enums, pointers
- `std.StringHashMap(V)` — for `[]const u8` keys, which need hashing by contents rather than by address

Both take an allocator when they are created, and both have to be released:

```zig
const std = @import("std");

var counts = std.AutoHashMap(u8, u32).init(allocator);
defer counts.deinit();
```

`put` stores a value, replacing any previous one for that key:

```zig
try counts.put('a', 1);
```

`get` returns an [optional][optionals], because the key might not be there:

```zig
const n = counts.get('a') orelse 0;
```

`contains` answers the same question as a `bool`, and `count()` gives the number of entries.

Counting things is common enough to have its own shape. `getOrPut` finds the entry or creates it, and tells you which it did:

```zig
const entry = try counts.getOrPut(letter);
if (!entry.found_existing) entry.value_ptr.* = 0;
entry.value_ptr.* += 1;
```

`entry.value_ptr` is a pointer into the map, so writing through it updates the stored value directly.

To walk everything in the map, ask for an iterator. The order is unspecified:

```zig
var it = counts.iterator();
while (it.next()) |entry| {
    // entry.key_ptr.*, entry.value_ptr.*
}
```

[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals

## Which map to use

`AutoHashMap` works for any key the compiler knows how to hash and compare structurally. That covers integers, enums, and structs of those. It deliberately refuses slices, because hashing a `[]const u8` by its pointer and length is almost never what anyone means — so `StringHashMap` exists to hash by contents.

`std.AutoArrayHashMap` and `std.StringArrayHashMap` are the ordered variants: they keep insertion order and iterate faster, at the cost of slower deletion. When iteration order matters — and it often does for tests — reach for those.

## The map does not own your keys

`StringHashMap` stores the slice you gave it, not a copy. If that slice was a temporary buffer, the key is dangling the moment the buffer goes away:

```zig
try map.put(temporary_buffer, 1); // the key is only as good as the buffer
```

When the map has to outlive the key's memory, duplicate it and take on the job of freeing it:

```zig
const owned = try allocator.dupe(u8, name);
try map.put(owned, 1);
```

`deinit` releases the map's own table and nothing else, so anything you duplicated has to be freed by iterating before you deinit.

## `getOrPut` is the important one

`get` then `put` hashes the key twice and races with itself if the map is modified in between. `getOrPut` does one lookup and hands back a pointer to the slot:

```zig
const entry = try counts.getOrPut(letter);
if (!entry.found_existing) entry.value_ptr.* = 0;
entry.value_ptr.* += 1;
```

`getOrPutValue(key, default)` is the shorthand when the default is a constant.

## Pointers into the map are temporary

`value_ptr`, `key_ptr` and anything from `getPtr` point into the map's table. Insert anything and the table may be rehashed and moved, leaving those pointers dangling. Use them immediately and do not store them.

## Removing and sizing

`remove(key)` returns a `bool` saying whether anything was there. `fetchRemove(key)` gives you the entry as well. `ensureTotalCapacity(n)` reserves room up front, after which `putAssumeCapacity` cannot fail.

## Iteration order is not stable

`std.HashMap` iterates in whatever order its table happens to be in, and that can change between runs and between Zig versions. Never write a test that depends on it. Sort the keys, or use an array hash map.
