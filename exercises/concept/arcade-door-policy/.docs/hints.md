# Hints

## General

- Every one of these functions returns a `bool`, so the body can be a single `return` of an expression.
- Zig will not let you mix `and` and `or` in one expression without parentheses.

## 1. Decide who may come in

- "One or the other" is `or`.

## 2. Decide who pays a deposit

- "This but not that" combines `and` with `!`.

## 3. Decide who is barred

- Read "unless X" as "and not X".

## 4. Decide who gets a free go

- Three conditions all have to hold, and `and` can be chained: `a and b and c`.
- Calling `isBarred(...)` here keeps the rule in one place, so a change to task 3 fixes both.
