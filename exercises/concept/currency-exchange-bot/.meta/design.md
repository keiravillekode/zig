# Design

## Goal

Show the student that in Zig an integer's width is part of its type, that overflow is an error rather than a silent wrap, and that wrapping or saturating has to be asked for explicitly.

## Learning objectives

- Know that integer types state their width and signedness, such as `u8`, `u32` and `i32`.
- Know that `/` truncates and `%` gives the remainder.
- Know that overflowing a sized integer is a bug that stops the program.
- Know the wrapping operators `+%`, `-%`, `*%` and the saturating operators `+|`, `-|`, `*|`.

## Out of scope

- `comptime_int` and how literals get their type.
- `@divFloor`, `@divTrunc`, `@mod` and `@rem`, and signed division rules.
- `@addWithOverflow` and the `std.math` checked helpers.
- `usize` and arbitrary widths such as `u3`.
- Floats.

## Concepts

- `integers`: sized integer types, truncating division and remainder, overflow as a bug, wrapping and saturating operators.

## Prerequisites

- `basics`: needs to declare functions and use the arithmetic operators.

## Analyzer

No analyzer support.
