# Introduction

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
