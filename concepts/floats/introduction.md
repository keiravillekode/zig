# Introduction

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
