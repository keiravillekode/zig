# Design

## Goal

Teach that in Zig a failure is an ordinary value in the return type, and that every point where one can appear is visible in the source as `try` or `catch`.

## Learning objectives

- Know how to declare an error set with `error{ ... }`.
- Know that `E!T` is an error union, and that `E!void` is the shape for a fallible function with no result.
- Know how to produce an error with `return error.Name`.
- Know that `try` propagates an error to the caller.
- Know that `catch` handles one here and supplies a replacement value.
- Know that errors are values, with no exceptions or unwinding.

## Out of scope

- Inferred error sets, `!T` with no set named.
- Merging sets with `||`, and `anyerror`.
- `catch |err| switch (err)` and `catch unreachable`.
- `if (x) |v| else |e|`.
- `errdefer`, which belongs with `defer`.

## Concepts

- `error-sets`: `error{}`, error unions, `return error.X`, `try`, `catch`.

## Prerequisites

- `optionals`: needs the idea of a type that carries "something went differently", and the `orelse`/`catch` symmetry.

## Analyzer

No analyzer support.
