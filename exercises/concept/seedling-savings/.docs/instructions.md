# Instructions

Your younger cousin has been given a savings account for their birthday, and cannot work out why the interest is never a round number. You are going to write the calculator for them.

All the money here is in pounds, and the account pays interest once a year.

## 1. Work out one year's interest

Define the `interest` function, which takes a balance and an interest rate as a percentage, and returns the interest earned in one year.

```zig
interest(200.0, 4.5)
// => 9.0
```

## 2. Work out the new balance

Define the `balanceAfterOneYear` function, which takes a balance and a rate, and returns the balance once that year's interest has been added. Reuse the function from task 1.

```zig
balanceAfterOneYear(200.0, 4.5)
// => 209.0
```

## 3. Count the whole pounds

The cash machine only hands out whole pounds, and never rounds up.

Define the `wholePounds` function, which takes a balance and returns how many whole pounds it contains.

```zig
wholePounds(209.75)
// => 209
```

## 4. Work out the average deposit

Your cousin has been putting birthday money in for years and wants to know the average.

Define the `averageDeposit` function, which takes the total deposited in whole pence as a `u32` and the number of deposits as a `u32`, and returns the average as a float.

```zig
averageDeposit(1000, 8)
// => 125.0
```
