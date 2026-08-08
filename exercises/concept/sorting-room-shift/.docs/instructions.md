# Instructions

You are on a shift in the parcel sorting room, and the labelling machine needs software. Every label it produces is a fresh piece of memory, so every function here takes an allocator.

Each of these functions hands its result to the caller, who becomes responsible for freeing it.

## 1. Copy a label

Define the `copyLabel` function, which takes an allocator and a label, and returns a freshly allocated copy of it.

```zig
const copy = try copyLabel(allocator, "PARIS");
defer allocator.free(copy);
// copy is "PARIS", in memory of its own
```

## 2. Make a blank shelf tag

Define the `blankTag` function, which takes an allocator and a length, and returns a freshly allocated slice of that length filled with `'.'` characters.

```zig
const tag = try blankTag(allocator, 4);
defer allocator.free(tag);
// tag is "...."
```

## 3. Join two labels

Define the `joinLabels` function, which takes an allocator and two labels, and returns a freshly allocated slice holding the first followed by the second.

```zig
const joined = try joinLabels(allocator, "PAR", "IS");
defer allocator.free(joined);
// joined is "PARIS"
```

## 4. Repeat a label

Define the `repeatLabel` function, which takes an allocator, a label and a count, and returns a freshly allocated slice holding that many copies of the label end to end.

```zig
const repeated = try repeatLabel(allocator, "AB", 3);
defer allocator.free(repeated);
// repeated is "ABABAB"
```
