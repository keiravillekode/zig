# Hints

## General

- `[_]u8{'.'}` is a one-element array, and `** 8` repeats it eight times.
- A board is a `[8][8]u8`, so `board[row][column]` reads one square.
- An array declared `undefined` can be filled in element by element before it is returned.

## 1. Make an empty row

- The return type is `[8]u8`, so the compiler already knows what length to expect.

## 2. Count the squares

- `board.len` is the number of rows and `board[0].len` the number of columns.

## 3. Count one player's pieces

- Two nested `for` loops walk the rows and then the squares within each row.
- The outer loop can capture a whole row, and the inner loop can then walk that row.

## 4. Read the long diagonal

- Declare the result as `var result: [8]u8 = undefined;` and assign each element.
- A `for (0..8) |i|` loop gives you the index you need for both dimensions.
