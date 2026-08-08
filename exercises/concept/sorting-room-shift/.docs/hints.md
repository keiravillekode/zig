# Hints

## General

- The allocator's type is `std.mem.Allocator`, so you will need to import the standard library.
- Every one of these functions can fail, so each returns `![]u8` and the tests call them with `try`.
- These functions do not free what they return. The caller does, which is what the `defer` in each example is for.

## 1. Copy a label

- `allocator.dupe(u8, label)` allocates a copy in one step.

## 2. Make a blank shelf tag

- `allocator.alloc(u8, length)` gives you the space, but its contents are whatever was there before.
- `@memset(tag, '.')` fills it in one line.

## 3. Join two labels

- Allocate `first.len + second.len` bytes, then copy each part into its own half.
- `@memcpy(destination, source)` copies between slices of the same length, and `buffer[0..first.len]` names the first half.

## 4. Repeat a label

- The result is `label.len * count` bytes long.
- Walk the copies with a loop, working out where each one starts.
- If an allocation later fails, whatever you have already allocated has to be released — `errdefer` is the tool, though these functions are simple enough that a single allocation up front avoids the problem.
