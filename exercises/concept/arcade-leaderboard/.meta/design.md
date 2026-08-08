# Design

## Goal

Show that a method is only a function in the struct's namespace with the struct as its first parameter, and make the difference between a value receiver and a pointer receiver concrete.

## Learning objectives

- Know that a function declared inside a struct can be called with dot syntax, and that `a.f(b)` means `T.f(a, b)`.
- Know that `self` is an ordinary parameter and the name is a convention.
- Know that `self: Self` gets a copy and `self: *Self` can modify the caller's value.
- Know that Zig takes the address at the call site, and that the receiver must be a `var`.
- Know that a function with no `self` is a namespaced function, and the `init` convention.
- Know `@This()` and the `const Self = @This();` idiom.
- Know that `self.* = ...` replaces the whole struct.

## Out of scope

- `deinit` and anything requiring an allocator.
- `*const Self` receivers.
- Methods on enums and unions.
- Why Zig has no inheritance or dynamic dispatch.

## Concepts

- `methods`: methods in a struct namespace, `self`, value versus pointer receivers, `@This()`, the `init` convention.

## Prerequisites

- `structs`: needs a struct to declare methods on, and its field access and value semantics.

## Analyzer

No analyzer support.
