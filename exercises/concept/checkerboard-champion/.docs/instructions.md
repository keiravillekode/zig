# Instructions

The school draughts tournament needs a scorer, and you have volunteered. A board is 8 by 8 squares, and each square holds one byte: `'.'` for empty, `'w'` for a white piece and `'b'` for a black one.

## 1. Make an empty row

Define the `emptyRow` function, which takes no arguments and returns a `[8]u8` of eight `'.'` characters. Build it with the repeat operator rather than typing eight dots.

```zig
emptyRow()
// => { '.', '.', '.', '.', '.', '.', '.', '.' }
```

## 2. Count the squares

Define the `squareCount` function, which takes a board and returns how many squares it has. Work it out from the array's own lengths, not from the number 64.

```zig
squareCount(board)
// => 64
```

## 3. Count one player's pieces

Define the `countPieces` function, which takes a board and a piece character, and returns how many squares hold that piece.

```zig
countPieces(board, 'w')
// => 12
```

## 4. Read the long diagonal

Define the `diagonal` function, which takes a board and returns a `[8]u8` holding the squares where the row number equals the column number.

```zig
diagonal(board)
// => the eight squares from the top left corner to the bottom right
```
