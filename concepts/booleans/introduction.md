# Introduction

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
