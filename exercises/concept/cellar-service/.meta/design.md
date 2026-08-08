# Design

## Goal

Make the timing of `defer` concrete by giving the student an observable log, so that ordering, block scope and the difference from `errdefer` are all directly testable.

## Learning objectives

- Know that `defer` runs its statement when the enclosing block exits, by any route.
- Know that multiple defers run last-scheduled-first.
- Know that `defer` is scoped to the block, so one inside a loop body runs every turn.
- Know that `errdefer` runs only when the block is left by returning an error.
- Know the idiom of putting the cleanup on the line after the thing being cleaned up.

## Out of scope

- Allocators, which the next exercise pairs with `defer` properly.
- The `errdefer |err|` capture form.
- The restriction that a deferred statement may not `return` or `try`.
- Ordering with respect to the computed return value.

## Concepts

- `defer`: `defer`, reverse ordering, block scope, `errdefer`.

## Prerequisites

- `error-sets`: needs a fallible function for `errdefer` to have something to react to.

## Analyzer

No analyzer support.
