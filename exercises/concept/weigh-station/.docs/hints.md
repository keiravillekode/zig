# Hints

## General

- Widening an integer is always safe, so Zig does it for you. Narrowing is never automatic.
- `@intCast`, `@truncate` and friends work out what type to produce from where the result is going, so they take just the value.

## 1. Add up the axles

- Adding three `u8` values as `u8` values overflows before it can be widened; widen one of them first and the rest of the sum follows.
- `@as(u32, first)` is the way to say "do this sum in `u32`".

## 2. Send the total to the display

- `@intCast` narrows and treats a value that does not fit as a bug.
- The return type tells the compiler what to cast to.

## 3. Work out the checksum byte

- `@truncate` keeps the low bits and discards the rest without complaining.
- 600 is `0b10_0101_1000`; its low eight bits are `0b0101_1000`, which is 88.

## 4. Decide whether the lorry is overloaded

- No cast is needed at all. Write the comparison and let the `u16` widen to meet the `u32`.
