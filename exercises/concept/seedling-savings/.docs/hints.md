# Hints

## General

- `f64` is the right float type for all of these.
- A percentage is a hundredth, so a rate of `4.5` means `4.5 / 100.0` of the balance.

## 1. Work out one year's interest

- Multiply and divide in whichever order reads best; both give the same answer here.

## 2. Work out the new balance

- Call `interest(...)` rather than repeating its arithmetic.

## 3. Count the whole pounds

- `@intFromFloat` already throws away everything after the decimal point.
- The return type tells the builtin what integer type to produce.

## 4. Work out the average deposit

- Both arguments are integers, so both need `@floatFromInt` before they can be divided as floats.
- Without a type to infer from, wrap the conversion in `@as(f64, ...)`.
