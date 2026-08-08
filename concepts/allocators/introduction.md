# Introduction

Zig never allocates memory on your behalf. There is no garbage collector and no hidden `new`, so any function that needs memory has to be given somewhere to get it from — an `Allocator`, passed in as an ordinary parameter:

```zig
const std = @import("std");

pub fn copyLabel(allocator: std.mem.Allocator, label: []const u8) ![]u8 {
    return allocator.dupe(u8, label);
}
```

The methods you will use most are:

- `allocator.alloc(T, n)` — a slice of `n` items, uninitialised
- `allocator.free(slice)` — hand it back
- `allocator.dupe(T, slice)` — a fresh copy of an existing slice

Allocation can fail, so `alloc` and `dupe` return an error union. That is why the function above returns `![]u8` and its callers write `try`.

Whatever is allocated has to be freed exactly once, by whoever ends up owning it. Pairing the two with [`defer`][defer] is the standard shape:

```zig
const buffer = try allocator.alloc(u8, 64);
defer allocator.free(buffer);
```

When a function *returns* what it allocated, it does not free it — the caller now owns it, and the caller writes the `defer`. Say so in the function's name or its documentation, because the type does not.

In tests, `std.testing.allocator` checks that everything it handed out was given back, and fails the test if anything leaked.

[defer]: https://ziglang.org/documentation/0.16.0/#defer
