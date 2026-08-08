# Introduction

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
