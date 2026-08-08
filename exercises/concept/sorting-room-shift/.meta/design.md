# Design

## Goal

Establish Zig's central memory rule: nothing allocates unless it was handed an allocator, and whatever is allocated is freed exactly once by a known owner.

## Learning objectives

- Know that a function that needs memory takes a `std.mem.Allocator` parameter.
- Know `alloc`, `free` and `dupe`.
- Know that allocation can fail, so allocating functions return an error union.
- Know that `alloc` returns uninitialised memory.
- Know the `defer allocator.free(...)` pairing.
- Know that a function returning allocated memory transfers ownership to its caller.
- Know that `std.testing.allocator` fails a test that leaks.

## Out of scope

- The `Allocator` interface's implementation, and choosing between concrete allocators.
- Arenas.
- `errdefer` around partial allocation, beyond a mention in the hints.
- `std.testing.checkAllAllocationFailures`, which the practice exercises cover.
- `std.ArrayList`, which is next.

## Concepts

- `allocators`: `std.mem.Allocator`, `alloc`, `free`, `dupe`, allocation failure, ownership, `defer` pairing.

## Prerequisites

- `defer`: needs `defer` for the free, and `errdefer` for the failure path.
- `slices`: needs `[]u8` as the thing being allocated and returned.

## Analyzer

No analyzer support.
