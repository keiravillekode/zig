# Hints

## General

- A `switch` on a `u8` must end with an `else` case, because no one is going to list 256 values.
- Cases are separated by commas, including the last one.
- A character in single quotes, such as `'A'`, is just a `u8` with that character's byte value.

## 1. Complement a base

- Four cases and an `else` that returns what it was given.
- `else => |other| other` captures the unmatched value, though here you can also name the parameter directly.

## 2. Identify the purines

- Several values can share one case: `'A', 'G' => true`.

## 3. Count the hydrogen bonds

- Two cases of two values each, and an `else` for everything else.

## 4. Band a quality score

- A range case is written `20...49 =>`, with three dots, and both ends are included.
- The last band has no upper limit, so `else` can cover it.
