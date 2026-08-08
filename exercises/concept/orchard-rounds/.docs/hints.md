# Hints

## General

- A counter that a loop changes has to be a `var`, not a `const`.
- The value captured from a range is a `usize`, so it may need converting before it mixes with a `u32`.

## 1. Count the trees

- Row `n` has `n` trees, so add each row number to a running total.
- `for (1..rows + 1) |n|` walks the row numbers themselves.

## 2. Count the rounds

- Keep subtracting a round's worth from what is left and count how many times you could.
- A `while` loop with a continue expression, `while (left > 0) : (rounds += 1)`, keeps the stepping in one place.

## 3. Count the rows you actually work

- A row is wild when its number divides exactly by three, which `%` will tell you.
- `continue` skips straight to the next turn of the loop.

## 4. Stop when the basket is full

- Keep a running total of apples and `break` as soon as it reaches the capacity.
- Count the rows in their own variable, since the loop's own value disappears when you break out of it.
