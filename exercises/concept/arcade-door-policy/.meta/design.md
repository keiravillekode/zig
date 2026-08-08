# Design

## Goal

Give the student practice building boolean expressions out of `and`, `or` and `!`, and to meet Zig's refusal to mix `and` with `or` unparenthesised.

## Learning objectives

- Know that `bool` has exactly the two values `true` and `false`.
- Know how to combine bools with `and`, `or` and `!`.
- Know that `and` and `or` short-circuit.
- Know that `!` binds more tightly than `and` and `or`, and that mixing `and` with `or` requires parentheses.
- Know that Zig has no truthiness.

## Out of scope

- `if` statements and expressions; the tasks are deliberately branch-free.
- The bitwise operators `&`, `|` and `^` applied to bools.
- `@intFromBool` and the memory layout of `bool`.
- Comparison operators, since no task needs one.

## Concepts

- `booleans`: the `bool` type, `and`, `or`, `!`, short-circuiting, precedence.

## Prerequisites

- `basics`: needs to declare functions with typed parameters and return values from them.

## Analyzer

No analyzer support.
