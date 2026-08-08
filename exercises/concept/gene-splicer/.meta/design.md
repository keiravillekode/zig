# Design

## Goal

Teach `switch` as the natural way to map one value onto many alternatives, including multi-value cases and ranges, and to meet exhaustiveness for the first time.

## Learning objectives

- Know how to write a `switch` expression with `pattern => result` cases.
- Know that several values can share one case, and that ranges use `...` with both ends included.
- Know that a `switch` must be exhaustive, and that `else` is how an integer switch achieves that.
- Know that there is no fall-through between cases.
- Know that a character literal such as `'A'` is a `u8`.

## Out of scope

- Switching on enums and tagged unions, and the exhaustiveness benefit that brings.
- Payload captures with `|value|`.
- Blocks with `break :blk`.
- `inline else` and labelled switch.

## Concepts

- `switch`: switch expressions, multi-value cases, range cases, exhaustiveness, `else`.

## Prerequisites

- `conditionals`: needs the idea of branching, and has seen `if` chains that `switch` improves on.

## Analyzer

No analyzer support.
