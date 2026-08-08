# Introduction

`while` repeats a block as long as its condition holds:

```zig
var remaining: u32 = 5;
while (remaining > 0) {
    remaining -= 1;
}
```

`for` walks a range instead of testing a condition. The values it produces are captured between vertical bars:

```zig
var total: u32 = 0;
for (1..4) |n| {
    total += n; // 1, then 2, then 3
}
```

A range `a..b` includes `a` and stops before `b`, and the captured value is a `usize`.

Two keywords steer a loop from the inside. `break` leaves it immediately, and `continue` skips to the next turn:

```zig
for (1..100) |n| {
    if (n % 3 == 0) continue; // skip the multiples of three
    if (n > limit) break; // stop altogether
    total += n;
}
```

A `while` loop can also carry a *continue expression* in parentheses, which runs at the end of every turn. It keeps the stepping next to the condition:

```zig
var i: u32 = 0;
while (i < 10) : (i += 1) {
    total += i;
}
```
