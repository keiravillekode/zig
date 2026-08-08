# Hints

## General

- A builtin starts with `@`, needs no import, and is called like an ordinary function.
- The [language reference lists them all][builtins]; the ones here are `@min`, `@abs`, `@popCount` and `@addWithOverflow`.

## 1. Find the smallest reading

- `@min` takes as many arguments as you like, so all three go in one call.

## 2. Measure a gap

- `@abs` gives the magnitude, and its result is the unsigned version of the type it was given.
- Subtracting two `i32` values may be negative, which is exactly what `@abs` is for.

## 3. Count the raised flags

- `@popCount` counts the set bits of an integer.

## 4. Add without falling over

- `@addWithOverflow(a, b)` returns a tuple: `[0]` is the wrapped result and `[1]` is `1` when it overflowed.
- The question is only about `[1]`, so compare it against `0`.

[builtins]: https://ziglang.org/documentation/0.16.0/#Builtin-Functions
