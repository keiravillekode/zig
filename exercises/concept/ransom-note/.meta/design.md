# Design

## Goal

Introduce the hash map through the one job it is best at — counting — and along the way the `getOrPut` idiom and the optional that `get` returns.

## Learning objectives

- Know that `std.AutoHashMap(K, V)` handles most key types and `std.StringHashMap(V)` handles string keys.
- Know that a map is created with `init(allocator)` and released with `deinit()`.
- Know `put`, and that `get` returns an optional.
- Know `count()`.
- Know the `getOrPut` idiom, `found_existing`, and writing through `value_ptr`.
- Know how to iterate a map, and that the order is unspecified.

## Out of scope

- The ordered array hash maps.
- Key ownership, and duplicating keys that outlive their buffers.
- Invalidation of pointers into the map after an insertion.
- `remove`, `fetchRemove` and capacity management.

## Concepts

- `hash-maps`: `AutoHashMap`, `StringHashMap`, `init`/`deinit`, `put`, `get`, `count`, `getOrPut`, iteration.

## Prerequisites

- `allocators`: needs an allocator to create the map, and the ownership rules for returning one.
- `strings`: needs `[]const u8` texts to walk byte by byte.

## Analyzer

No analyzer support.
