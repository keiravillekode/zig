# Design

## Goal

Teach the student where Zig converts types on its own and where it insists on being told, and to make a deliberate choice between `@intCast` and `@truncate`.

## Learning objectives

- Know that Zig coerces implicitly only when no information can be lost, so widening is automatic and narrowing is not.
- Know how to use `@as` to fix the type an expression is evaluated at.
- Know that `@intCast` narrows and treats an unrepresentable value as a bug.
- Know that `@truncate` narrows by keeping the low bits, deliberately.
- Know that these builtins infer their result type from context.

## Out of scope

- Float conversions, which the student meets in the next exercise.
- `@bitCast` and `@ptrCast`.
- Enum and pointer coercions.
- Peer type resolution as a named idea.

## Concepts

- `type-coercion`: implicit widening, `@as`, `@intCast`, `@truncate`, result location semantics.

## Prerequisites

- `integers`: needs to know that integer types have a fixed width and that overflow is a bug.

## Analyzer

No analyzer support.
