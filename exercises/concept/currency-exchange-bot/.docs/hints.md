# Hints

## General

- `u8` holds 0 to 255. Ordinary `+` on a `u8` that would exceed 255 stops the program rather than wrapping.
- Zig has a separate operator for each of the two ways of handling that, so the code says which one you meant.

## 1. Work out how many notes to hand over

- Integer division with `/` already throws away the remainder.

## 2. Work out the change

- The remainder operator is `%`.

## 3. Top up the float without overflowing

- The saturating add is `+|`.

## 4. Advance the transaction counter

- The wrapping add is `+%`.
