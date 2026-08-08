# Hints

## General

- A new list starts as `var list: std.ArrayList([]const u8) = .empty;`.
- Every operation that might allocate takes the allocator as its first argument, and can fail, so needs `try`.
- Each of these functions ends by handing the buffer over with `return list.toOwnedSlice(allocator);`.
- Pair the list with `errdefer list.deinit(allocator);` rather than `defer`, so that it is only released if something fails before the handover.

## 1. Collect the tracks

- A `for` loop over the tracks, appending each one.
- `appendSlice` can do the whole thing in a single call.

## 2. Leave out the banned track

- Tracks are slices, so compare them with `std.mem.eql(u8, a, b)` rather than `==`.
- `continue` skips the banned track without appending it.

## 3. Put one track on repeat

- `appendNTimes(allocator, track, count)` does this in one call.

## 4. Take turns

- Loop while either list still has tracks left, keeping one index for each.
- On each turn, append from the first list if it has anything left, then from the second.
