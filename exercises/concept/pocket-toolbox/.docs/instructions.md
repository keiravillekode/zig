# Instructions

You are writing the utility layer that the rest of your team's code will call. Every one of these could be written out by hand with a loop or a comparison, and every one of them is a builtin instead.

## 1. Find the smallest reading

Define the `smallest` function, which takes three sensor readings and returns the smallest. Use a builtin rather than comparisons.

```zig
smallest(-3, 5, 7)
// => -3
```

## 2. Measure a gap

Define the `gap` function, which takes two readings and returns how far apart they are. The answer is never negative, so its type is unsigned.

```zig
gap(-3, 5)
// => 8
```

## 3. Count the raised flags

A status byte packs eight independent flags, and the diagnostics want to know how many are raised.

Define the `flagsRaised` function, which takes a status byte and returns how many of its bits are set.

```zig
flagsRaised(0b1010_0100)
// => 3
```

## 4. Add without falling over

Two readings are added together, and the caller needs to know whether the answer fitted.

Define the `wouldOverflow` function, which takes two `u8` readings and returns whether adding them overflows. It must not stop the program when they do.

```zig
wouldOverflow(250, 10)
// => true
```
