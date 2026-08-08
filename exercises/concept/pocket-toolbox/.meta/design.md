# Design

## Goal

Introduce the `@` family as a normal part of writing Zig, rather than something exotic, and show the overflow builtins as the answer to a question the student already has from the `integers` exercise.

## Learning objectives

- Know that builtins begin with `@`, are provided by the compiler and need no import.
- Know `@min` and `@max`, and that they take any number of arguments.
- Know `@abs` and that its result is unsigned.
- Know `@popCount`.
- Know the `@addWithOverflow` family and its tuple return.
- Know that `@import`, `@as`, `@intCast` and `@tagName`, already met, are the same kind of thing.

## Out of scope

- `@typeInfo` and reflection, which belong with generics.
- `@memset` and `@memcpy`, used in the allocators exercise without being the point of it.
- `@sizeOf`, `@typeName` and anything taking a type.
- `std.math.add` and the error-returning wrappers.

## Concepts

- `builtin-functions`: `@`-prefixed compiler builtins, `@min`, `@abs`, `@popCount`, `@addWithOverflow`.

## Prerequisites

- `integers`: needs fixed-width types and the overflow question these builtins answer.
- `slices`: needed only so that the concept can talk about `@memset` and `@memcpy` in passing.

## Analyzer

No analyzer support.
