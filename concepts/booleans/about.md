# About

Zig's `bool` type has exactly two values, written `true` and `false`:

```zig
const doors_open = true;
var alarm_ringing: bool = false;
```

Three operators combine them. `and` is true only when both sides are true, `or` is true when at least one side is, and `!` flips a value:

```zig
true and false // false
true or false  // true
!true          // false
```

`and` and `or` short-circuit: if the left side already settles the answer, the right side is never evaluated at all.

`!` binds more tightly than `and` and `or`, so `!a and b` means "not a, and b". Mixing `and` and `or` in one expression without parentheses is a compile error in Zig — you have to say which you meant:

```zig
(a and b) or c // fine
a and b or c   // error: 'and' and 'or' cannot be mixed
```

Zig has no truthiness. An integer is not a condition, and a `bool` is not a number; only a `bool` can go where a `bool` is expected.

## Comparisons produce bools

The comparison operators `==`, `!=`, `<`, `<=`, `>` and `>=` all evaluate to a `bool`, which is what makes them usable as conditions:

```zig
const in_range = score >= 0 and score <= 100;
```

Because there is no truthiness, `if (count)` is an error where `if (count > 0)` is what you meant. The compiler catches the confusion instead of guessing.

## Why mixing is banned

Most languages give `and` a higher precedence than `or`, so `a and b or c` quietly means `(a and b) or c`. Enough people have misread that over the years for Zig to refuse the expression entirely. The parentheses cost one keystroke and remove a whole class of bug.

## Short-circuiting is a guarantee

Short-circuit evaluation is not an optimisation you hope for — it is part of the language, so you can rely on it to guard the right-hand side:

```zig
if (index < items.len and items[index] == target) { ... }
```

If `index` is out of range the second half never runs, so the indexing never happens.

## `bool` in memory

A `bool` is one byte when stored on its own, and one bit inside a packed struct. If you ever need it as a number, the conversion is explicit through `@intFromBool`, which gives `1` for `true` and `0` for `false`.

## Bitwise operators on bools

`&`, `|` and `^` also accept `bool` operands, where they act as non-short-circuiting and, or and exclusive-or. `^` is genuinely useful, since there is no `xor` keyword:

```zig
const exactly_one = a ^ b;
```

Reach for `and` and `or` by default, and for `&` and `|` only when you specifically need both sides evaluated.
