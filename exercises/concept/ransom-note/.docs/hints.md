# Hints

## General

- The keys here are single bytes, so `std.AutoHashMap(u8, u32)` is the map you want.
- A map is created with `init(allocator)` and released with `deinit()`, which takes no allocator because the map remembered it.
- A function that returns a map does not deinit it; the caller does.

## 1. Count the letters in a text

- `getOrPut` finds or creates the entry in one lookup, and `entry.found_existing` says which happened.
- `entry.value_ptr` points at the stored value, so `entry.value_ptr.* += 1` updates it in place.
- Pair the map with `errdefer counts.deinit();` so it is released if an insertion fails part way through.

## 2. Read a count safely

- `get` returns an optional, so `orelse 0` gives the answer for a letter that was never seen.

## 3. Count the distinct letters

- Build the counts and then ask the map how many entries it has with `count()`.
- Remember to `deinit` the map before returning, since this function does not hand it over.

## 4. Decide whether the note could be cut

- Build the counts for both texts, then walk the note's counts with an iterator.
- `entry.key_ptr.*` and `entry.value_ptr.*` read the key and value out of an iterator entry.
- The note is impossible as soon as one letter is short, so you can return `false` straight away.
