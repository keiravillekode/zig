# Instructions

You have taken a summer job counting birds in an orchard. The orchard is planted in rows: the first row has one tree, the second has two, and so on down the field.

## 1. Count the trees

Define the `treesInOrchard` function, which takes the number of rows and returns how many trees there are altogether. Work it out with a loop rather than a formula.

```zig
treesInOrchard(4)
// => 10
```

## 2. Count the rounds

You can only carry so many trees' worth of birdseed on one trip, so you walk as many rounds as it takes. A part-full round still counts.

Define the `roundsNeeded` function, which takes a number of trees and how many you can service per round, and returns how many rounds you have to walk.

```zig
roundsNeeded(10, 4)
// => 3
```

## 3. Count the rows you actually work

Every third row is left wild for the birds, so you skip rows 3, 6, 9 and so on.

Define the `rowsWorked` function, which takes the number of rows and returns how many of them you work. Use a `for` loop over a range and `continue` past the wild rows.

```zig
rowsWorked(7)
// => 5
```

## 4. Stop when the basket is full

Walking from the first row onwards, you pick one apple per tree, so row `n` gives you `n` apples. You stop the moment the basket is full or overflowing.

Define the `rowsUntilBasketFull` function, which takes the basket's capacity and returns how many rows you walked. If you walk the whole orchard of 100 rows without filling it, return 100.

```zig
rowsUntilBasketFull(6)
// => 3
```
