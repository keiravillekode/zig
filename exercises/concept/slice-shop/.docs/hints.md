# Hints

## General

- A slice you only read is a `[]const u8`; one you may write through is a `[]u8`.
- `.len` is the number of elements, and it is a `usize`.

## 1. Count the slices

- A string literal such as `"mmpph"` coerces straight to a `[]const u8`.

## 2. Take the first half

- Integer division already rounds down, so `pizza.len / 2` is the length you want.
- A range starting at zero is written `pizza[0..end]`.

## 3. Cut a portion

- The two arguments are exactly the two ends of the range.

## 4. Mark a tray as sold

- The parameter has to be a `[]u8`, since a `[]const u8` cannot be written through.
- `for (tray) |*slot|` captures a pointer to each element, and `slot.* = 'x'` writes through it.
- The return type of a function that returns nothing is `void`.
