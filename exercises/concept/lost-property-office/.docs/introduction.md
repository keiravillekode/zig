# Introduction

An optional type is written `?T`. A value of that type is either a `T` or `null`:

```zig
var owner: ?u32 = null;
owner = 17;
```

Zig has no null anywhere else. A `u32` can never be null, so the only way a value can be missing is if its type says so — and then the compiler will not let you use it until you have dealt with that.

`orelse` supplies a fallback:

```zig
const id = owner orelse 0;
```

`if` can unwrap it instead, binding the value to a name for the body. The `else` branch runs when it was `null`:

```zig
if (owner) |id| {
    return id * 2;
} else {
    return 0;
}
```

`.?` unwraps without a fallback, and stops the program if the value was `null`. Use it only where being missing would be a bug:

```zig
const id = owner.?;
```

Comparing against `null` with `==` and `!=` works and gives a `bool`, which is handy when you only want to know whether something is there.

A function signals "no answer" by returning an optional:

```zig
fn find(items: []const u32, wanted: u32) ?usize { ... }
```
