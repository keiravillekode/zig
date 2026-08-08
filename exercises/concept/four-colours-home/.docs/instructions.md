# Instructions

You are writing the rules engine for a family board game. Four players — green, red, blue and yellow — race their counters around a track of 52 squares and home again.

The exercise file already declares the colours:

```zig
pub const Colour = enum { green, red, blue, yellow };
```

Every one of these tasks switches on that enum. Do not write an `else` branch in any of them: listing all four is what makes the compiler tell you about a fifth player later.

## 1. Find each player's starting square

Green starts on square 0, red on 13, blue on 26 and yellow on 39.

Define the `startSquare` function, which takes a colour and returns its starting square.

```zig
startSquare(.blue)
// => 26
```

## 2. Pass the dice on

Play goes green, red, blue, yellow, and then back to green.

Define the `nextPlayer` function, which takes a colour and returns whose turn is next.

```zig
nextPlayer(.yellow)
// => .green
```

## 3. Name a colour

Define the `colourName` function, which takes a colour and returns its name as a string. Zig can do this for you without a switch at all.

```zig
colourName(.red)
// => "red"
```

## 4. Work out who is partners with whom

Green and yellow play as one team; red and blue play as the other.

Define the `arePartners` function, which takes two colours and returns whether they are on the same team. A player is not their own partner.

```zig
arePartners(.green, .yellow)
// => true
```
