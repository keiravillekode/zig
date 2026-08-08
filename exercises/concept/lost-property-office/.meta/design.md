# Design

## Goal

Introduce the optional as the only way a value can be absent in Zig, and the three ways of dealing with one: `orelse`, an `if` capture, and a comparison with `null`.

## Learning objectives

- Know that `?T` holds either a `T` or `null`, and that nothing else in Zig can be null.
- Know how to supply a fallback with `orelse`.
- Know how to unwrap with an `if` capture, `if (opt) |value|`.
- Know that an optional can be compared against `null`.
- Know how to return an optional to signal "no answer".

## Out of scope

- `.?`, which the tasks deliberately avoid so that students reach for a safe form first.
- `orelse return`, and `orelse` with a side-effecting right-hand side.
- `while` with an optional capture.
- Capturing a pointer with `|*value|`.
- The memory layout of `?*T`.
- Error unions, which come next and are deliberately kept separate.

## Concepts

- `optionals`: `?T`, `null`, `orelse`, `if` payload captures, comparing with `null`, returning an optional.

## Prerequisites

- `conditionals`: needs `if` and `else`, which the capture syntax extends.

## Analyzer

No analyzer support.
