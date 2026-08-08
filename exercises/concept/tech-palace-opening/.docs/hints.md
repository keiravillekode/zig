# Hints

## General

- `@import` is a builtin, so it starts with `@` and is called like a function.
- Imports are conventionally `const` declarations at the very top of the file.
- The [standard library documentation][std] is searchable, and `std.math` is where the numeric helpers live.

## 1. Report the opening hour

- `@import` takes the file name as a string, including the `.zig` extension.
- Reach into what it returns with a dot, the same way you would reach into a struct.

## 2. Work out how long the shop is open

- The catalog declares both the opening and the closing hour.

## 3. Price a bundle

- The catalog already has a function for this; you only need to pass the two counts through to it.

## 4. Cap a discount

- `std.math.clamp` takes the value, a lower bound and an upper bound.
- You will need to import the standard library as well as the catalog.

[std]: https://ziglang.org/documentation/0.16.0/std/
