# Instructions

You are writing the scheduling software for a work gang. The workers are linked into a chain, each one holding on to the next, and the foreman's tools need to reach into records rather than copy them about.

The exercise file already declares a link in the chain:

```zig
pub const Link = struct {
    id: u32,
    next: ?*const Link = null,
};
```

`next` is an optional pointer, so the last worker in the chain simply has `null`.

## 1. Add a worker to the tally

Define the `addOne` function, which takes a pointer to a tally and returns nothing, adding one to whatever it points at.

```zig
var tally: u32 = 3;
addOne(&tally);
// tally is now 4
```

## 2. Swap two workers over

Define the `swap` function, which takes two pointers to worker numbers and returns nothing, exchanging the two values.

```zig
var a: u32 = 1;
var b: u32 = 2;
swap(&a, &b);
// a is 2 and b is 1
```

## 3. Renumber a worker

Define the `renumber` function, which takes a pointer to a `Link` and a new number, and returns nothing, changing that link's `id`.

```zig
var worker = Link{ .id = 1 };
renumber(&worker, 7);
// worker.id is now 7
```

## 4. Measure the chain

Define the `chainLength` function, which takes the first link of a chain and returns how many workers are in it. The chain may be empty, in which case it is given `null`.

```zig
chainLength(&first)
// => 3
```
