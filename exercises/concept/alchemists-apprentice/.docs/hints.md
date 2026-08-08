# Hints

## General

- A function's return type goes after its parameter list, before the `{`.
- Every function the tests call must be marked `pub`, or they cannot see it.
- Values that never change are worth naming with a [`const`][values] at the top of the file.

## 1. Define the simmer time

- A function that always gives the same answer can simply `return` that number.

## 2. Work out the remaining simmer time

- Subtraction is `-`.
- Rather than writing `25` a second time, call `simmerTimeInMinutes()` from inside this function.

## 3. Work out the grinding time

- Multiplication is `*`.

## 4. Price a bottle

- One expression can combine `*` and `+`; the multiplication happens first.

[values]: https://ziglang.org/documentation/0.16.0/#Values
