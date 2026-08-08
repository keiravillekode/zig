# Hints

## General

- An optional type is written with a leading `?`, as in `?u32`.
- The compiler will not let you use an optional as if it were the value inside it; you always have to say what should happen when it is `null`.

## 1. Give an owner or say unknown

- `orelse` supplies the value to use when there is none.

## 2. Say whether an item has been claimed

- An optional can be compared with `null` using `!=`, which gives a `bool` directly.

## 3. Look an item up in the ledger

- The return type is `?usize`, so the function can return either an index or `null`.
- `for (codes, 0..) |code, index|` walks the values and their positions together.
- Return `null` after the loop, for when nothing matched.

## 4. Work out the storage fee

- `if (days) |d| { ... } else { ... }` unwraps the optional into `d` for the first branch.
- Guard against the free week before subtracting, or the subtraction will overflow.
