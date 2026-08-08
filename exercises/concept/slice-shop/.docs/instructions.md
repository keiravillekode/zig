# Instructions

You are working the counter at a pizza place that sells by the slice. A pizza arrives as a row of slices, each one a single byte naming its topping, and customers keep asking for parts of it.

## 1. Count the slices

Define the `sliceCount` function, which takes a pizza and returns how many slices it has.

```zig
sliceCount("mmpph")
// => 5
```

## 2. Take the first half

A customer who cannot decide takes the first half, rounding down when the count is odd.

Define the `firstHalf` function, which takes a pizza and returns a view of its first half.

```zig
firstHalf("mmpph")
// => "mm"
```

## 3. Cut a portion

Define the `portion` function, which takes a pizza, a start index and an end index, and returns the slices from the start index up to but not including the end index.

```zig
portion("mmpph", 1, 4)
// => "mpp"
```

## 4. Mark a tray as sold

At the end of the day every remaining slice on a tray is marked with an `'x'`.

Define the `markSold` function, which takes a tray you are allowed to write through and returns nothing, replacing every slice with `'x'`.

```zig
var tray = [_]u8{ 'm', 'p', 'h' };
markSold(&tray);
// tray is now { 'x', 'x', 'x' }
```
