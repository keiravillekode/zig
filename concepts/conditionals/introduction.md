# Introduction

`if` chooses between two paths based on a `bool`:

```zig
if (score > 100) {
    return 100;
} else {
    return score;
}
```

The condition must be a `bool`. Zig has no truthiness, so `if (count)` will not compile where `if (count != 0)` is meant.

Several tests can be chained with `else if`, and the chain stops at the first branch that matches:

```zig
if (attempts <= 3) {
    return 10;
} else if (attempts <= 6) {
    return 5;
} else {
    return 1;
}
```

`if` is also an *expression*, so it can produce a value rather than just picking a path. Each branch supplies one, and there is no `?:` operator because this fills the same role:

```zig
const cost: u32 = if (attempts < 5) 1 else 2;
```

When `if` is used this way the `else` is compulsory: the expression has to have a value whichever way the test goes.
