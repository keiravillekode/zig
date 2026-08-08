# Hints

## General

- Where the type is already known, an enum value can be written as just `.green`.
- A switch over an enum does not need an `else`, and is better without one.

## 1. Find each player's starting square

- Four cases, one per colour, each returning a number.

## 2. Pass the dice on

- The return type is `Colour`, so each case can be written as `.red` rather than `Colour.red`.

## 3. Name a colour

- `@tagName` takes an enum value and gives back its name.

## 4. Work out who is partners with whom

- Several values can share one switch case: `.green, .yellow => ...`.
- Work out which team each colour is on, then compare the two teams and check the colours are not the same.
