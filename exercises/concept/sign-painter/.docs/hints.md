# Hints

## General

- A string is a `[]const u8`, so everything you know about slices applies to it.
- The [`std.mem`][mem] namespace has the functions for comparing and searching slices, and you will need to import the standard library to reach them.

## 1. Count the letters

- A slice already knows its own length.

## 2. Recognise an OPEN sign

- `std.mem.eql` takes the element type first: `std.mem.eql(u8, a, b)`.

## 3. Recognise a for-sale sign

- `std.mem.startsWith` has the same shape as `std.mem.eql`.

## 4. Price a sign

- Walk the sign one byte at a time with a `for` loop and count the ones that are not `' '`.
- A space is the character literal `' '`.

[mem]: https://ziglang.org/documentation/0.16.0/std/#std.mem
