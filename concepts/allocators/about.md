# About

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

## `Allocator` is an interface

`std.mem.Allocator` is a struct holding a pointer and a table of function pointers. Passing one costs two words, and it means a function is not tied to any particular strategy — the caller decides.

Which is the real reason for the parameter. A library that allocates internally has made a policy decision for every one of its users; a library that takes an `Allocator` has not.

## The ones you will meet

| Allocator | Use |
| --- | --- |
| `std.testing.allocator` | tests; detects leaks and double frees |
| `std.heap.DebugAllocator` | development; leak detection with stack traces |
| `std.heap.page_allocator` | straight from the OS, coarse and slow |
| `std.heap.ArenaAllocator` | many allocations freed together, in one go |
| `std.heap.FixedBufferAllocator` | hands out chunks of a buffer you already have |

The arena deserves a mention: it never frees individual allocations, and releases everything at once when it is deinitialised. For work with a clear end — parsing one document, handling one request — it removes the bookkeeping entirely.

```zig
var arena = std.heap.ArenaAllocator.init(backing_allocator);
defer arena.deinit();
const allocator = arena.allocator(); // no individual frees needed
```

## Ownership is a convention

Nothing in the type system says who frees a slice. `[]u8` looks the same whether it was allocated, taken from a string literal, or is a view into someone else's buffer. The conventions that fill the gap:

- a function returning allocated memory says so, often by taking the allocator as its first parameter
- `toOwnedSlice` in the standard library means "you own this now"
- a type that owns memory has a `deinit`, and you `defer` it on the line after `init`

## `errdefer` when building something

If a function allocates and then does more work that might fail, the allocation has to be released on the failure path but not on the success path. That is exactly `errdefer`:

```zig
const buffer = try allocator.alloc(u8, size);
errdefer allocator.free(buffer);
try fill(buffer); // if this fails, the buffer is freed; if it succeeds, the caller owns it
```

## Testing for leaks and for failure

`std.testing.allocator` fails a test that leaks. Beyond that, `std.testing.checkAllAllocationFailures` runs a function repeatedly, making each allocation in turn fail, and checks that nothing leaks on any of those paths. The practice exercises on this track use it heavily, and it will find `errdefer` mistakes nothing else does.

## `alloc` gives you uninitialised memory

`allocator.alloc(u8, 8)` does not zero anything; the contents are whatever was there before. Fill it before reading it. `@memset(buffer, 0)` does that in one line.
