# Design

## Goal

Introduce the tagged union as Zig's sum type, and the switch capture that is the only safe way into its payload.

## Learning objectives

- Know that a union holds one of several values at a time, and that `union(enum)` adds a tag saying which.
- Know how to declare fields with payloads and fields without.
- Know how to build a union value by naming the active field.
- Know that a switch on a tagged union captures the payload with `|value|`.
- Know that such a switch is exhaustive, as for an enum.
- Know that `@tagName` works on the tag.

## Out of scope

- Bare, untagged unions.
- Naming the tag enum separately with `union(MemberKind)`.
- Capturing a pointer with `|*value|` to modify a payload in place.
- Methods declared inside a union body.
- Comparing a union against a tag with `==`.

## Concepts

- `unions`: `union(enum)`, payload and payload-free fields, building values, switch payload captures, `@tagName`.

## Prerequisites

- `enums`: needs enums and exhaustive switching, which the tag is built from.
- `structs`: needs a struct, since one of the payloads is one.

## Analyzer

No analyzer support.
