# Design

## Goal

Introduce the slice as a view onto elements someone else owns, and the difference between a read-only and a writable one.

## Learning objectives

- Know that a slice is a pointer plus a length, written `[]T`, and that the length is not part of the type.
- Know how to slice with a range, and that the range excludes its upper bound.
- Know that `&array` produces a slice of the whole array.
- Know the difference between `[]const T` and `[]T`.
- Know that writing through a slice changes the underlying array.
- Know that `.len` is a `usize`.

## Out of scope

- The lifetime hazard of returning a slice of a local array; the tasks are arranged so it cannot arise.
- Sentinel-terminated slices.
- `*[N]T`, the result of slicing with compile-time known bounds.
- `std.mem` helpers, which arrive with `strings`.

## Concepts

- `slices`: `[]T`, slicing ranges, `&array`, `[]const T` versus `[]T`, `.len`, writing through a slice.

## Prerequisites

- `arrays`: needs an array to slice, and indexing and iteration to build on.

## Analyzer

No analyzer support.
