# Design

## Goal

Introduce the pointer as the way to reach and change a value that lives somewhere else, and the optional pointer as the way to say "or nothing".

## Learning objectives

- Know that `*T` holds the address of a value, that `&` takes one and that `.*` dereferences.
- Know that a function must take a pointer in order to change its caller's value.
- Know that `*const T` is a read-only pointer and should be preferred where possible.
- Know that a field is reached through a pointer with a plain dot.
- Know that a pointer cannot be null, and that `?*T` is how absence is expressed.
- Know that `while (opt) |value|` unwraps an optional on each turn of a loop.

## Out of scope

- Many-item pointers `[*]T` and pointer arithmetic.
- The lifetime hazard of returning a pointer to a local.
- Pointer captures in `for` loops.
- Alignment and `@alignCast`.

## Concepts

- `pointers`: `*T`, `&`, `.*`, `*const T`, field access through a pointer, `?*T`.

## Prerequisites

- `structs`: needs a struct to point at and fields to reach through the pointer.

## Analyzer

No analyzer support.
