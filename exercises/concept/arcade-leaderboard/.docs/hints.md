# Hints

## General

- A method is just a function declared inside the struct whose first parameter is the struct.
- `const Self = @This();` at the top of the struct body saves repeating the type's name.
- Methods that the tests call have to be `pub`, like any other declaration.

## 1. Start a new leaderboard

- A function with no `self` parameter is a namespaced function, called as `Leaderboard.init()`.
- Every field has a default, so the body can return `.{}`.

## 2. Say whether a score would take the top spot

- This method only reads, so take `self` by value.

## 3. Record a play

- This method changes the leaderboard, so `self` has to be a pointer: `self: *Self`.
- Fields are reached through the pointer with a plain dot, as `self.plays += 1`.
- The play is counted whether or not the score is a new best.

## 4. Clear the table

- `self.* = init();` replaces the whole struct in one go.
