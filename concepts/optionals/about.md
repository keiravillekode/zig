# About

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

## What it costs

For most types `?T` is a `T` plus a single byte flag, rounded up for alignment. For a pointer it is free: `?*T` is the same size as `*T`, because the null pointer value is used as the `null` representation. That is the one place where Zig's optional and C's null pointer meet.

## `orelse` does more than supply a default

The right-hand side of `orelse` is an expression, so it can do work, and it is only evaluated when the value is `null`:

```zig
const cached = lookup(key) orelse computeExpensively(key);
```

It can also leave the function entirely, since `return` is an expression of type `noreturn`:

```zig
const id = owner orelse return 0;
```

That idiom flattens what would otherwise be a nested `if`, and reads as a guard clause.

## Unwrapping in a loop

`while` takes the same capture syntax, which is the standard shape for draining an iterator that reports the end with `null`:

```zig
while (iterator.next()) |item| { ... }
```

## Getting a pointer to the payload

Capturing with `|value|` gives you a copy. To modify the thing inside an optional, capture a pointer with `|*value|`:

```zig
if (maybe_score) |*score| {
    score.* += 1;
}
```

## Optionals and errors are different

An optional says "there might be nothing here", and that is normal. An [error union][errors] says "this might have failed", and carries a reason why. Looking up a key that is absent returns an optional; opening a file that is not there returns an error. Do not reach for an error when nothing has gone wrong, and do not use `null` to mean failure when the caller will want to know the cause.

`orelse` and `catch` mirror each other deliberately, and `.?` is the optional's version of `try`-without-a-caller.

[errors]: https://ziglang.org/documentation/0.16.0/#Errors
