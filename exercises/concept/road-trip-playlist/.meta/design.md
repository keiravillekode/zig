# Design

## Goal

Introduce the growable sequence, and with it the `errdefer` / `toOwnedSlice` pattern for a function that builds something and hands it over.

## Learning objectives

- Know that `std.ArrayList(T)` is a growable sequence starting from `.empty`.
- Know that it is unmanaged, so the allocator is passed to each operation that needs it.
- Know that `append` can fail and returns an error union.
- Know that `.items` is a slice of the current contents.
- Know `appendSlice` and `appendNTimes`.
- Know that `toOwnedSlice` hands the buffer to the caller, and that `errdefer deinit` is the right pairing alongside it.

## Out of scope

- Capacity, `initCapacity` and `appendAssumeCapacity`.
- `pop`, `orderedRemove` and `swapRemove`.
- The invalidation of `.items` after a modification.
- The older `std.array_list.Managed` form.

## Concepts

- `array-lists`: `std.ArrayList`, `.empty`, `append`, `appendSlice`, `appendNTimes`, `.items`, `toOwnedSlice`, `errdefer deinit`.

## Prerequisites

- `allocators`: needs an allocator to pass, and the ownership rules for what is returned.

## Analyzer

No analyzer support.
