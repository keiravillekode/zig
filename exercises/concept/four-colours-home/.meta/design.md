# Design

## Goal

Introduce the enum, and above all the exhaustiveness guarantee that makes switching over one safer than switching over an integer.

## Learning objectives

- Know that `enum { ... }` declares a type with a fixed set of named values.
- Know that a value can be written `.name` where the type is already known.
- Know that a switch over an enum must cover every value, and that omitting `else` is what makes a later addition a compile error.
- Know that several values can share one case.
- Know `@tagName`.

## Out of scope

- `@intFromEnum`, `@enumFromInt` and explicit tag types.
- Non-exhaustive enums.
- Methods declared inside an enum body.
- `std.meta.stringToEnum`.
- Tagged unions, which are next.

## Concepts

- `enums`: enum declarations, `.name` shorthand, exhaustive switching, shared cases, `@tagName`.

## Prerequisites

- `switch`: needs switch expressions, which the enum makes exhaustive.

## Analyzer

No analyzer support.
