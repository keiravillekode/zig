# About

A Zig integer type says exactly how many bits it has and whether it is signed. `u8` is an unsigned 8-bit integer, `i32` a signed 32-bit one, and any width from `u0` to `u65535` is available:

```zig
const small: u8 = 200;
const temperature: i32 = -40;
```

Arithmetic uses `+`, `-`, `*`, `/` and `%`. Division between integers throws the remainder away, and `%` is what is left over:

```zig
17 / 5 // 3
17 % 5 // 2
```

If a result will not fit in its type, that is a bug, and Zig treats it as one: the program stops rather than silently wrapping. `200 + 100` in a `u8` is an error, not `44`.

When wrapping *is* what you want, there are separate operators that say so. `+%` wraps around, and `+|` saturates at the limit instead:

```zig
var counter: u8 = 250;
counter +%= 10; // 4, having wrapped past 255
counter = 250;
counter +|= 10; // 255, having stopped at the maximum
```

`-%`, `*%`, `-|` and `*|` work the same way.

## Choosing a width

The type is part of the design, not an afterthought. `u8` for a byte, `u32` for a count that cannot go negative, `i64` for something that can. `usize` is the type of a length or an index, and is as wide as a pointer on the target machine — that is what slice lengths use.

Arbitrary widths are genuinely arbitrary: `u3` holds 0 to 7, and `u1` is a single bit. They are useful for packed data and for saying precisely what a value can be.

## What overflow actually does

In a safe build an overflowing operation panics with a clear message and a stack trace. In `ReleaseFast` the check is removed and the behaviour is undefined, which is why the wrapping operators exist: they are defined in every build mode.

`std.math` also has functions that report overflow rather than trapping, returning an error you can handle:

```zig
const total = try std.math.add(u8, a, b); // error.Overflow instead of a panic
```

And the `@addWithOverflow` family return both the result and a bit saying whether it wrapped.

## Division has rules

Integer division by zero is a bug and traps. So is `@divTrunc(minInt(i8), -1)`, which has no representable answer.

For signed integers, `/` and `%` are only allowed when the answer is unambiguous; otherwise you pick the rounding you want explicitly with `@divTrunc`, `@divFloor` or `@divExact`, and `@mod` or `@rem` to match. `@divFloor(-7, 2)` is `-4` while `@divTrunc(-7, 2)` is `-3`.

## Literals are not sized

A number written in source has type `comptime_int` until it is given a type. It has no width and cannot overflow, so the compiler can work with values far larger than any machine integer and only complains when one is stored somewhere too small.

Underscores make long literals readable, and other bases are available:

```zig
const million = 1_000_000;
const mask = 0b1010_1010;
const address = 0xDEAD_BEEF;
const perms = 0o755;
```

## Limits

`std.math.maxInt(u8)` and `std.math.minInt(i8)` give the bounds of a type, which beats writing `255` and hoping the type never changes.
