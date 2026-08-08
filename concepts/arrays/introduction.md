# Introduction

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
