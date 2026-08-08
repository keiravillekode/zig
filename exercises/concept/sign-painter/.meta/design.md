# Design

## Goal

Establish that a Zig string is nothing but a `[]const u8`, and that comparing and searching one is a job for `std.mem` rather than an operator.

## Learning objectives

- Know that a string is a slice of bytes and that a string literal coerces to `[]const u8`.
- Know that `.len` counts bytes.
- Know that `==` on slices does not compare contents, and that `std.mem.eql` does.
- Know `std.mem.startsWith`.
- Know how to walk a string byte by byte with `for`.
- Know that a character literal such as `' '` is a `u8`.

## Out of scope

- UTF-8 decoding, code points and graphemes, beyond a mention in the concept's about page.
- Building or allocating new strings.
- `std.mem.indexOf`, which returns an optional the student has not met yet.
- Multiline string literals and escape sequences.

## Concepts

- `strings`: `[]const u8`, string literals, byte length, `std.mem.eql`, `std.mem.startsWith`, byte iteration.

## Prerequisites

- `slices`: needs `[]const u8`, `.len` and iteration.
- `importing`: needs `@import("std")` to reach `std.mem`.

## Analyzer

No analyzer support.
