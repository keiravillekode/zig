# Design

## Goal

Give the student the two looping constructs and the two ways of steering them, without needing any data structure to iterate over — ranges are enough.

## Learning objectives

- Know how to write a `while` loop, including the `: (step)` continue expression.
- Know how to write a `for` loop over a range and capture the value with `|n|`.
- Know that a range `a..b` excludes `b`, and that the captured value is a `usize`.
- Know how `break` and `continue` change the flow of a loop.
- Know that a loop variable must be declared `var`.

## Out of scope

- Iterating arrays and slices, which arrive with those concepts.
- `break value` and the loop `else` clause.
- Labelled loops.
- `while` with an optional capture.
- `inline for` and `inline while`.

## Concepts

- `control-flow`: `while`, `for` over a range, continue expressions, `break` and `continue`.

## Prerequisites

- `conditionals`: needs `if` to decide when to break or continue.

## Analyzer

No analyzer support.
