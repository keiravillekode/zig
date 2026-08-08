# Design

## Goal

Teach the bitwise operators through the one use that justifies them for a beginner: treating an integer as a row of independent flags.

## Learning objectives

- Know `&`, `|`, `^`, `~`, `<<` and `>>` and what each does to individual bits.
- Know the set, clear and test idioms built from a single-bit mask.
- Know that `^` marks the positions where two values differ.
- Know that the shift amount has a type just wide enough to name a bit position, `u3` for a `u8`.
- Know that binary literals with `_` separators make bit work readable.

## Out of scope

- Signed integers, arithmetic shift and two's complement.
- `@popCount`, `@clz` and `@ctz`, which belong with the builtins.
- `<<|`, `@shlExact` and `std.math.Log2Int`.
- `packed struct` and `std.EnumSet`.

## Concepts

- `bitwise-operations`: `&`, `|`, `^`, `~`, `<<`, `>>`, single-bit masks, set/clear/test.

## Prerequisites

- `integers`: needs fixed-width integer types, since a bit position only means anything within one.

## Analyzer

No analyzer support.
