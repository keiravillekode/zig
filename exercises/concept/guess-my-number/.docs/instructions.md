# Instructions

You are refereeing a guessing game at the school fair. One player thinks of a number between 1 and 100, the other guesses, and you say whether the guess was too low, too high or right. The prize depends on how many guesses it took.

## 1. Judge a guess

Define the `compare` function, which takes a guess and the secret number and returns:

- `-1` if the guess is too low
- `0` if the guess is right
- `1` if the guess is too high

```zig
compare(30, 42)
// => -1
```

## 2. Award the points

The fewer guesses, the better the prize:

- 3 guesses or fewer scores 10 points
- 4 to 6 guesses scores 5 points
- anything more scores 1 point

Define the `pointsFor` function, which takes the number of guesses used and returns the points.

```zig
pointsFor(5)
// => 5
```

## 3. Price a hint

A hint costs 1 token for the first four guesses and 2 tokens after that.

Define the `hintCost` function, which takes the number of guesses used so far and returns the cost. Write the body as a single `const` assigned from an `if` expression, then return it.

```zig
hintCost(6)
// => 2
```

## 4. Keep a guess in range

Players sometimes shout a number outside the range. Rather than rejecting it, you pull it back to the nearest end.

Define the `clampGuess` function, which takes a guess and returns it moved into the range 1 to 100 inclusive.

```zig
clampGuess(140)
// => 100
```
