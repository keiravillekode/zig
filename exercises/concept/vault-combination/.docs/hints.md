# Hints

## General

- A mask with one bit set is `@as(u8, 1) << position`. The `@as` is there because a bare `1` has no width to shift within.
- Working the mask out once at the top of each function keeps the rest short.

## 1. Raise a tumbler

- `|` sets a bit and leaves the others alone.

## 2. Drop a tumbler

- `~mask` is every bit *except* the one you want, and `&` with it clears just that one.

## 3. Check a tumbler

- `state & mask` is zero when the bit is clear and non-zero when it is set.
- Compare against `0` rather than against `1`, since the surviving bit is worth `1 << position`, not `1`.

## 4. Compare against the combination

- The operator that gives 1 exactly where two values differ is a single one.
