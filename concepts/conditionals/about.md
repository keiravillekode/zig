# About

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

## Braces are optional, parentheses are not

The condition always needs parentheses. The body does not need braces if it is a single statement:

```zig
if (overheating) shutDown();
```

Most Zig code still uses braces, and `zig fmt` will not add or remove them for you.

## The whole thing is one expression

Because `if` is an expression, it composes in places a statement could not go:

```zig
const label = if (temperature < 0) "ice" else if (temperature < 100) "water" else "steam";
```

Both branches have to agree on a type, or coerce to a common one. If the branches genuinely have nothing in common the compiler will say so.

An `if` used as a statement is really an expression of type `void`, which is why an `else`-less `if` is fine there but not when you want a value.

## Blocks can produce values too

A branch that needs more than one line can still yield a value, by labelling the block and breaking out of it:

```zig
const price = if (is_member) blk: {
    const base = catalogPrice(item);
    break :blk base - discount(base);
} else catalogPrice(item);
```

`blk:` names the block and `break :blk value` leaves it with a value. This is the general mechanism; `switch` and loops use it too.

## Payload captures

`if` does more than test bools. Given an [optional][optionals] or an [error union][errors], it can unwrap the value into a name for the body:

```zig
if (findScore(player)) |score| {
    return score;
} else {
    return 0;
}
```

The `|score|` part is a *capture*. Those forms are covered with the concepts they belong to, but it is worth knowing early that `if` is the same keyword doing all three jobs.

## Comparison chaining does not exist

`0 <= x <= 10` does not mean what it does in mathematics, and Zig rejects it rather than quietly comparing a bool with a number. Write it out:

```zig
if (x >= 0 and x <= 10) { ... }
```

[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals
[errors]: https://ziglang.org/documentation/0.16.0/#Errors
