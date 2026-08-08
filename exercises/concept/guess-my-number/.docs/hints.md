# Hints

## General

- The condition of an `if` must be a `bool`, and it must be in parentheses.
- Chain tests with `else if`; the first branch that matches is the one that runs.

## 1. Judge a guess

- The return type has to hold negative numbers, so it is a signed integer.
- Three outcomes need two tests: one for too low, one for too high, and the `else` covers the rest.

## 2. Award the points

- Order the tests from the smallest bound upwards, and each later branch only has to rule out the ones above it.

## 3. Price a hint

- Used as an expression, `if` looks like `const cost: u32 = if (condition) a else b;`.
- The `else` is compulsory when an `if` produces a value.

## 4. Keep a guess in range

- Two bounds means two tests and a fall-through for the values already in range.
- Writing the bounds as named `const` values at the top of the file keeps the comparisons readable.
