# About

A function declared inside a struct becomes a method of that struct:

```zig
const Leaderboard = struct {
    top_score: u32 = 0,

    pub fn isEmpty(self: Leaderboard) bool {
        return self.top_score == 0;
    }
};
```

There is nothing magic about `self`. It is an ordinary first parameter, and the name is only a convention. What is special is the call syntax: `board.isEmpty()` means `Leaderboard.isEmpty(board)`.

Taking `self` by value hands the method a copy, so it can read the struct but not change it. To change the caller's struct, take a pointer:

```zig
pub fn record(self: *Leaderboard, score: u32) void {
    if (score > self.top_score) self.top_score = score;
}
```

Zig takes the address for you at the call site, so `board.record(120)` still reads the same — though `board` then has to be a `var`.

A function inside a struct that has no `self` parameter is not a method, just a namespaced function. That is how constructors are written:

```zig
pub fn init() Leaderboard {
    return .{};
}
```

and called as `Leaderboard.init()`.

`@This()` gives a struct its own type from inside its body, so it is conventional to alias it and use that instead of repeating the name:

```zig
const Self = @This();
```

## Method call syntax is the only sugar

`a.b(c)` is rewritten to `T.b(a, c)` when `b` is a declaration in `a`'s type. That is the whole feature. There is no dispatch table, no inheritance and no `this` — which is why a method is exactly as fast as the free function it desugars to, and why you can always call it the long way when that reads better.

## Choosing the receiver

- `self: Self` — the method only reads. The struct is copied, so this is best for small structs.
- `self: *Self` — the method modifies the caller's struct.
- `self: *const Self` — the method only reads, but you would rather not copy a large struct.

The compiler will not let you call a `*Self` method on a `const` value, which is how "this changes things" is enforced rather than merely documented.

## The `init` and `deinit` convention

Zig has no constructors or destructors, only a naming convention the whole ecosystem follows:

```zig
pub fn init(allocator: std.mem.Allocator) Self { ... }
pub fn deinit(self: *Self) void { ... }
```

`init` builds a value, `deinit` releases whatever it owns. When a type has a `deinit`, `defer thing.deinit()` on the line after creating it is the standard shape. You will meet it constantly once [allocators][memory] arrive.

Types with nothing to release often skip `init` entirely and use default field values, so `.{}` is enough.

## Replacing the whole struct

Because `self` is a pointer, `self.* = ...` assigns a whole new value over the old one:

```zig
pub fn reset(self: *Self) void {
    self.* = init();
}
```

## Methods on other types

Any type declared in a struct-like body can have methods, so enums and unions can too. Primitive types cannot — you cannot add a method to `u32` — which keeps the meaning of a call site local to types you can see.

[memory]: https://ziglang.org/documentation/0.16.0/#Memory
