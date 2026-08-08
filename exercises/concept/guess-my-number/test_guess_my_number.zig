const std = @import("std");
const testing = std.testing;

const game = @import("guess_my_number.zig");

// task 1
test "a guess below the secret is too low" {
    try testing.expectEqual(-1, game.compare(30, 42));
}

test "a guess above the secret is too high" {
    try testing.expectEqual(1, game.compare(70, 42));
}

test "a guess equal to the secret is right" {
    try testing.expectEqual(0, game.compare(42, 42));
}

test "one below the secret is still too low" {
    try testing.expectEqual(-1, game.compare(41, 42));
}

// task 2
test "a lucky first guess scores ten" {
    try testing.expectEqual(10, game.pointsFor(1));
}

test "three guesses still scores ten" {
    try testing.expectEqual(10, game.pointsFor(3));
}

test "four guesses scores five" {
    try testing.expectEqual(5, game.pointsFor(4));
}

test "six guesses still scores five" {
    try testing.expectEqual(5, game.pointsFor(6));
}

test "seven guesses scores one" {
    try testing.expectEqual(1, game.pointsFor(7));
}

// task 3
test "an early hint costs one token" {
    try testing.expectEqual(1, game.hintCost(0));
}

test "the fourth guess still gets the cheap hint" {
    try testing.expectEqual(1, game.hintCost(4));
}

test "a late hint costs two tokens" {
    try testing.expectEqual(2, game.hintCost(6));
}

// task 4
test "a guess in range is left alone" {
    try testing.expectEqual(42, game.clampGuess(42));
}

test "a guess below the range is pulled up" {
    try testing.expectEqual(1, game.clampGuess(0));
}

test "a guess above the range is pulled down" {
    try testing.expectEqual(100, game.clampGuess(140));
}

test "the ends of the range are in range" {
    try testing.expectEqual(1, game.clampGuess(1));
    try testing.expectEqual(100, game.clampGuess(100));
}
