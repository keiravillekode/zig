# Design

## Goal

Introduce the fixed-size array: how to make one, that its length is part of its type, how to index it, and how to walk it with `for`.

## Learning objectives

- Know that an array's length is part of its type, so `[3]u8` and `[4]u8` differ.
- Know the `[_]T{...}` inferred-length form and the `**` repeat operator.
- Know how to index an array and that `.len` gives its length.
- Know that `for` iterates an array directly.
- Know that arrays nest, and that `[8][8]u8` is indexed `grid[row][col]`.
- Know that `undefined` declares an array to be filled in later.

## Out of scope

- Slices, and the fact that arrays coerce to them.
- Sentinel-terminated arrays and string literals.
- Pointers to arrays, and the copying cost of passing large arrays.
- `std.mem` helpers.

## Concepts

- `arrays`: fixed-size arrays, literals, `**`, indexing, `.len`, iteration, nesting, `undefined`.

## Prerequisites

- `control-flow`: needs `for` loops to walk the rows and columns.

## Analyzer

No analyzer support.
