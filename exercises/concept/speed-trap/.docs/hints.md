# Hints

## General

- A struct value is built by naming its fields with a leading dot: `Vehicle{ .plate = plate, .speed_kph = speed }`.
- Where the type is already known — such as a function's return type — you can write `.{ ... }` and leave the name out.
- Fields are read with a dot: `vehicle.speed_kph`.

## 1. Record a vehicle

- `warnings` has a default, so leaving it out of the literal is not an omission.

## 2. Decide whether a vehicle is speeding

- "Above the limit" is a strict comparison.

## 3. Add a warning

- Copy the vehicle into a `var`, change the field on the copy, and return it.
- Because assigning a struct copies it, the vehicle you were given is untouched.

## 4. Work out the fine

- Check first whether the vehicle is speeding at all; subtracting otherwise would overflow.
- Reuse `isSpeeding` rather than repeating the comparison.
