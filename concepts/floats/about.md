# About

Floats hold values with a fractional part. `f64` is the usual choice and `f32` the smaller one:

```zig
const rate: f64 = 4.5;
const half = 0.5;
```

They use the same operators as integers, except that `/` no longer throws the remainder away:

```zig
7.0 / 2.0 // 3.5
```

Zig will not mix integers and floats for you. A count and a rate are different kinds of thing, and turning one into the other is always written out:

```zig
const deposits: u32 = 4;
const average = total / @as(f64, @floatFromInt(deposits));
```

`@floatFromInt` turns an integer into a float, and `@intFromFloat` goes back the other way, throwing away everything after the decimal point:

```zig
const whole: u32 = @intFromFloat(12.9); // 12
```

Floats are approximations, so `==` between two computed floats is rarely what you want. Compare them by checking that the difference is small enough instead.

## The available types

`f16`, `f32`, `f64`, `f80` and `f128` are all IEEE-754 formats. `f64` is the default choice: `f32` runs out of precision after about seven significant digits, which is less than you think when money is involved.

There is also `comptime_float`, the type of a float literal before it has been given one. Like `comptime_int` it is arbitrary precision, and it becomes a real float only when it is stored somewhere typed.

## Why `==` is a trap

`0.1 + 0.2` is not `0.3`, in Zig or anywhere else, because none of those values has an exact binary representation. Compare with a tolerance:

```zig
try std.testing.expectApproxEqAbs(0.3, 0.1 + 0.2, 1e-9);
```

`std.math.approxEqAbs` and `approxEqRel` do the same job outside tests. Comparing against a literal you assigned yourself is fine; comparing the results of two different calculations is not.

## Special values

Floats have values integers do not: positive and negative infinity, and NaN, "not a number", which is what `0.0 / 0.0` produces. NaN is not equal to anything, including itself, so `x != x` is a NaN test. `std.math.isNan`, `isInf` and `isFinite` say it more clearly.

## Rounding

`@floor`, `@ceil`, `@round` and `@trunc` all take a float and return a float. `@intFromFloat` truncates towards zero on its own, so it agrees with `@trunc` and not with `@floor` for negative numbers.

Converting a float that is out of the integer type's range, or is NaN, is a bug and traps in safe builds.

## Money

Do not store money in a float. A price of 1.15 is not exactly 1.15, and the error compounds every time you add. Count in the smallest unit — pence, cents, satoshis — using an integer, and only convert to a float for display.
