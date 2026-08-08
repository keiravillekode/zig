# Design

## Goal

Move the student from combining bools to acting on them: branching with `if` and `else if`, and using `if` as an expression that produces a value.

## Learning objectives

- Know how to write an `if` / `else` statement, and that the condition needs parentheses and must be a `bool`.
- Know how to chain tests with `else if` and that the first match wins.
- Know that `if` is an expression that can produce a value, and that the `else` is then compulsory.
- Know that Zig has no ternary operator because `if` already covers it.

## Out of scope

- `switch`, which the student meets next.
- Labelled blocks and `break :blk`.
- Payload captures on optionals and error unions.
- Loops of any kind.

## Concepts

- `conditionals`: `if` / `else if` / `else` as a statement and as an expression.

## Prerequisites

- `booleans`: needs to write the comparisons and combinations that form the conditions.

## Analyzer

No analyzer support.
