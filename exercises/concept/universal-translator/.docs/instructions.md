# Instructions

The station's translator has to handle every kind of signal it meets — bytes, sample numbers, error codes — and the team refuses to maintain four copies of the same four functions.

Each of these takes the element type as a `comptime` parameter.

## 1. Take the first reading, or a fallback

Define the `firstOr` function, which takes a type, a list of readings and a fallback, and returns the first reading, or the fallback when there are none.

```zig
firstOr(u32, &[_]u32{ 7, 8 }, 0)
// => 7
```

## 2. Count the matches

Define the `countMatching` function, which takes a type, a list of readings and a wanted value, and returns how many readings equal it.

```zig
countMatching(u8, "abracadabra", 'a')
// => 5
```

## 3. Find the largest reading

Define the `largest` function, which takes a type and a list of readings, and returns the largest, or `null` when the list is empty.

```zig
largest(u32, &[_]u32{ 3, 9, 4 })
// => 9
```

## 4. Build a box for any type

Define the `Box` function, which takes a type and returns a struct type with a single field `value` of that type and a method `get` returning it.

```zig
const boxed = Box(u32){ .value = 10 };
boxed.get()
// => 10
```
