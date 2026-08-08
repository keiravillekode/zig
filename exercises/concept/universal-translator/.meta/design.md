# Design

## Goal

Show that Zig's generics are nothing more than compile-time parameters of type `type`, and that generic containers such as `std.ArrayList` are ordinary functions returning a struct.

## Learning objectives

- Know that a generic function takes a `comptime T: type` parameter.
- Know that the type parameter must precede the parameters whose types depend on it.
- Know that the caller passes the type explicitly as an argument.
- Know that a function may return a `type`, and that this is how generic containers are built.
- Know the convention of naming a type-returning function in `TitleCase`.
- Know `@This()` for naming an anonymous struct's own type.

## Out of scope

- `@typeInfo`, `std.meta` and reflection-driven generics.
- `@compileError` for constraint checking.
- Memoisation of instantiated types.
- `anytype` parameters.

## Concepts

- `generics`: `comptime T: type`, generic functions, functions returning `type`, `@This()`.

## Prerequisites

- `comptime`: needs compile-time parameters, of which a `type` parameter is one.
- `structs`: needs a struct for the generic container to be.

## Analyzer

No analyzer support.
