# Hints

## General

- A generic parameter is written `comptime T: type`, and it has to come before any parameter whose type mentions it.
- Inside the function, `T` is used exactly like a real type name.
- Callers pass the type as the first argument: `firstOr(u32, ...)`.

## 1. Take the first reading, or a fallback

- The list is a `[]const T` and the fallback and return type are both `T`.

## 2. Count the matches

- `==` works for integers, and those are the only types the tests use.
- The return type is `usize`, since it is a count of elements.

## 3. Find the largest reading

- The return type is `?T`, so an empty list can answer `null`.
- Start from the first element and compare the rest against it.

## 4. Build a box for any type

- The function's return type is `type`, and its body returns a `struct { ... }` expression.
- The struct has no name of its own, so its method names its type with `@This()`.
- Name the function in `TitleCase`, because what it returns is a type.
