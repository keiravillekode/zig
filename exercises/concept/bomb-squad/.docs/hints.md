# Hints

## General

- A function that can fail returns an error union, written `DefusalError!u32`.
- A function that succeeds without producing anything returns `DefusalError!void`.
- An error is returned with `return error.Name;`, using the name from the set.

## 1. Cut a wire

- On success there is nothing to return, so a bare `return;` or simply falling off the end will do.

## 2. Read the timer

- Check the failing case first and return the error, then the ordinary path is a plain subtraction.
- Guarding first also stops the subtraction from overflowing.

## 3. Defuse the bomb

- `try` on a call that returns `!void` runs it and propagates any error: `try cutWire(colour);`.
- `try` on a call that returns a value gives you that value: `const left = try secondsLeft(elapsed);`.

## 4. Report to the operator

- `catch` supplies the value to use when the call failed: `defuse(...) catch 0`.
- This function cannot fail, so its return type is a plain `u32` with no `!`.
