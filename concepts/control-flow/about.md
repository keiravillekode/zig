# About

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

## `for` walks things, `while` tests things

The two are not interchangeable in Zig. `for` needs something with a known length — a range, an [array][arrays], a [slice][slices] — and cannot run forever. `while` takes a condition and can. Choosing `for` when you can is a small guarantee to the reader that the loop terminates.

`for` can walk several sequences at once, as long as they are the same length:

```zig
for (names, scores) |name, score| { ... }
```

and can produce an index alongside the values by adding an open-ended range:

```zig
for (items, 0..) |item, index| { ... }
```

## Why the continue expression exists

`while (i < 10) : (i += 1)` and putting `i += 1` at the bottom of the body look equivalent, and for a plain loop they are. They differ when the body uses `continue`: the continue expression still runs, whereas a statement at the bottom of the body is skipped. That difference is the usual cause of an accidental infinite loop, so the continue expression is the safer habit.

## Loops are expressions

Every loop can produce a value. `break value` supplies it, and the `else` branch supplies the one for when the loop finished without breaking:

```zig
const found = for (haystack) |item| {
    if (item == needle) break item;
} else null;
```

Read the `else` as "ran out without breaking". It works on `while` too, and is how a search reports failure without a flag variable.

## Labels

Nested loops can be broken or continued by name, which saves the flag variable that usually creeps in:

```zig
outer: for (rows) |row| {
    for (row) |cell| {
        if (cell == 0) continue :outer;
    }
}
```

## `while` with captures

Like `if`, `while` can unwrap an [optional][optionals]. This is the standard shape for consuming an iterator, and you will meet it whenever the standard library hands you one:

```zig
while (iterator.next()) |item| { ... }
```

## `inline` loops

`inline for` and `inline while` are unrolled by the compiler, so the loop variable is known at compile time. That is required when each turn of the loop has a different *type*, and is otherwise a rarely-needed optimisation. It belongs with [comptime][comptime].

[arrays]: https://ziglang.org/documentation/0.16.0/#Arrays
[slices]: https://ziglang.org/documentation/0.16.0/#Slices
[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals
[comptime]: https://ziglang.org/documentation/0.16.0/#comptime
