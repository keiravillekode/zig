# Design

## Goal

Introduce the struct: declaring one as a new type, building values with field literals, reading fields, and the fact that a struct is copied on assignment.

## Learning objectives

- Know that `const Name = struct { ... }` declares a new type.
- Know how to build a value with a field literal, and that fields are named with a leading dot.
- Know that a field can have a default, which may then be omitted.
- Know the anonymous form `.{ ... }` where the type is inferred from context.
- Know how to read and write a field with a dot.
- Know that structs are values, so assigning or passing one copies it.

## Out of scope

- Methods, which are the next concept.
- Pointers to structs, and mutating a caller's struct.
- Tuples and anonymous struct literals with no field names.
- Memory layout, `extern struct` and `packed struct`.
- Comparing structs with `std.meta.eql`.

## Concepts

- `structs`: declaring a struct type, field literals, default field values, field access, value semantics.

## Prerequisites

- `basics`: needs `const` declarations and functions that take and return values.

## Analyzer

No analyzer support.
