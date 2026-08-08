# Design

## Goal

Show that Zig's compile-time execution is the same language running earlier, and give the student the three forms they will actually use: `comptime` blocks, `comptime` parameters, and compile-time computation of constants.

## Learning objectives

- Know that a `comptime` block runs during compilation and leaves a constant behind.
- Know the `comptime blk: { ... break :blk value; }` form for producing a value.
- Know that a `comptime` parameter must be known by the caller, and can therefore appear in the return type.
- Know that a `comptime var` is a compile-time variable that does not exist at run time.
- Know that `comptime` is implied in array lengths and file-scope `const` initialisers.

## Out of scope

- `inline for` and per-iteration type changes, mentioned in the concept but not exercised.
- `@compileError`, `@compileLog` and `@setEvalBranchQuota`.
- `@typeInfo` and reflection.
- Returning a `type` from a function, which is the next exercise.

## Concepts

- `comptime`: `comptime` blocks, `comptime` parameters, `comptime var`, compile-time computation.

## Prerequisites

- `arrays`: needs array lengths, which are the most familiar compile-time value.
- `builtin-functions`: needs `@intCast` and the habit of talking to the compiler with `@`.

## Analyzer

No analyzer support.
