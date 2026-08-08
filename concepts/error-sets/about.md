# About

An error set is a type listing the things that can go wrong:

```zig
const DefusalError = error{
    WrongWire,
    OutOfTime,
};
```

A function that might fail returns an *error union*, written with `!` between the error set and the normal return type:

```zig
fn cutWire(colour: u8) DefusalError!void { ... }
```

Inside, an error is returned like any other value:

```zig
return error.WrongWire;
```

A caller cannot ignore it. `try` says "if this failed, return that same error from me; otherwise give me the value":

```zig
const seconds = try secondsLeft(elapsed);
```

`catch` handles it here instead, supplying a value to use when things went wrong:

```zig
const seconds = secondsLeft(elapsed) catch 0;
```

Leaving the error set off, as `!u32`, asks the compiler to work out which errors the function can actually produce. That is the usual style for a function whose errors all come from the things it calls.

Errors are values, not exceptions. Nothing unwinds, nothing is thrown, and every place an error can appear is marked in the source with `try` or `catch`.

## Errors are just values

An error is a small integer with a name, and an error union is that integer or your value, plus a tag saying which. There is no allocation, no stack unwinding and no hidden control flow. `try` is exactly `catch |err| return err`.

## Error sets merge

`error.WrongWire` is a global name. Two error sets that both list `WrongWire` mean the same value, so sets combine with `||` and a small set coerces into a larger one:

```zig
const CombinedError = DefusalError || FileError;
```

This is what makes inferred error sets practical: a function that calls three others ends up with the union of their errors, worked out for you.

`anyerror` is the set of every error in the program. It compiles, but it tells the caller nothing, so prefer an inferred set.

## Handling by kind

`catch` can capture the error and switch on it:

```zig
const seconds = secondsLeft(elapsed) catch |err| switch (err) {
    error.OutOfTime => 0,
    error.WrongWire => return err,
};
```

Because error sets are exhaustive, adding a new error to the set makes this switch stop compiling until you decide what it should do — the same safety net enums give.

## `errdefer`

`errdefer` runs its statement only when the function returns an error, which is how you undo half-finished work without duplicating the cleanup down every failure path. It belongs with [`defer`][defer], which the syllabus covers next.

## `try` is not a keyword for hiding failure

`try` propagates; it does not handle. A function full of `try` is saying "any of these failing means I fail too", which is usually right. When it is not, `catch` makes the alternative explicit at the point it happens.

Two more forms are worth knowing:

- `catch unreachable` — assert this cannot fail. Panics in safe builds if it does.
- `if (mightFail()) |value| { ... } else |err| { ... }` — handle both outcomes without either propagating or defaulting.

## Choosing between an error and an optional

Return an [optional][optionals] when nothing is wrong and there is simply no value — a lookup that missed. Return an error when something failed and the caller will want to know why. Errors carry a reason; `null` does not.

[defer]: https://ziglang.org/documentation/0.16.0/#defer
[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals
