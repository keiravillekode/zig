# About

An array holds a fixed number of values of one type. The length is part of the type, so `[3]u8` and `[4]u8` are as different as `u8` and `bool`:

```zig
const scores: [3]u32 = .{ 10, 20, 30 };
```

Writing `[_]` lets the compiler count the values for you:

```zig
const row = [_]u8{ 'r', 'n', 'b', 'q' }; // a [4]u8
```

`**` repeats an array, which is the tidiest way to fill one:

```zig
const blank = [_]u8{'.'} ** 8; // eight dots
```

Elements are read and written with square brackets, counting from zero, and `.len` gives the length:

```zig
var board = blank;
board[0] = 'k';
const size = board.len; // 8
```

An index outside the array is a bug, and the program stops rather than reading whatever happened to be next in memory.

`for` walks an array directly, without any index arithmetic:

```zig
for (row) |piece| { ... }
```

Arrays nest, so a grid is an array of arrays, read with two sets of brackets:

```zig
var grid: [8][8]u8 = .{blank} ** 8;
const square = grid[3][4];
```

## Arrays are values

An array is copied when it is assigned or passed to a function, exactly like an integer. `var copy = original;` gives you a separate array, and changing one does not touch the other.

That is convenient for small arrays and expensive for big ones. When you want to refer to an existing array rather than duplicate it, pass a [slice][slices] instead — which is what most Zig functions take.

## The length is compile-time knowledge

Because `[8]u8` states its length in the type, `array.len` is a compile-time constant, and the compiler can prove that a loop over the array terminates. It also means a function taking `[8]u8` genuinely cannot be handed nine elements.

## Bounds checking

Indexing outside an array panics in safe builds with the index and the length in the message. In `ReleaseFast` the check is gone and the read is undefined behaviour, which is the usual trade Zig offers: correct by default, fast when you have asked for it.

## Ways to write one

```zig
const a = [_]u32{ 1, 2, 3 };          // inferred length
const b: [3]u32 = .{ 1, 2, 3 };       // inferred type, from the annotation
const c = [_]u32{0} ** 3;             // repeated
var d: [3]u32 = undefined;            // uninitialised, to be filled in later
```

`undefined` means "do not initialise this". Reading it before writing is undefined behaviour, though safe builds fill it with `0xAA` bytes to make the mistake obvious.

## Sentinel-terminated arrays

`[3:0]u8` is an array of three bytes with a fourth, guaranteed to be zero, sitting after them. This is how Zig interoperates with C strings without giving up its own lengths. String literals are sentinel-terminated arrays: `"hi"` has type `*const [2:0]u8`.

## Multidimensional arrays

There is no special syntax; `[8][8]u8` is simply an array of arrays, laid out contiguously in memory. `grid[row][col]` reads left to right, so the first index selects a row.

[slices]: https://ziglang.org/documentation/0.16.0/#Slices
