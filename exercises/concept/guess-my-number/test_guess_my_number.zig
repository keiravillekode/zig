const std = @import("std");
const testing = std.testing;

const game = @import("guess_my_number.zig");

// task_id = 1
test "a guess below the secret is too low" {
    try testing.expectEqual(-1, game.compare(30, 42));
}

// task_id = 1
test "a guess above the secret is too high" {
    try testing.expectEqual(1, game.compare(70, 42));
}

// task_id = 1
test "a guess equal to the secret is right" {
    try testing.expectEqual(0, game.compare(42, 42));
}

// task_id = 1
test "one below the secret is still too low" {
    try testing.expectEqual(-1, game.compare(41, 42));
}

// task_id = 2
test "a lucky first guess scores ten" {
    try testing.expectEqual(10, game.pointsFor(1));
}

// task_id = 2
test "three guesses still scores ten" {
    try testing.expectEqual(10, game.pointsFor(3));
}

// task_id = 2
test "four guesses scores five" {
    try testing.expectEqual(5, game.pointsFor(4));
}

// task_id = 2
test "six guesses still scores five" {
    try testing.expectEqual(5, game.pointsFor(6));
}

// task_id = 2
test "seven guesses scores one" {
    try testing.expectEqual(1, game.pointsFor(7));
}

// task_id = 3
test "an early hint costs one token" {
    try testing.expectEqual(1, game.hintCost(0));
}

// task_id = 3
test "the fourth guess still gets the cheap hint" {
    try testing.expectEqual(1, game.hintCost(4));
}

// task_id = 3
test "a late hint costs two tokens" {
    try testing.expectEqual(2, game.hintCost(6));
}

// task_id = 4
test "a guess in range is left alone" {
    try testing.expectEqual(42, game.clampGuess(42));
}

// task_id = 4
test "a guess below the range is pulled up" {
    try testing.expectEqual(1, game.clampGuess(0));
}

// task_id = 4
test "a guess above the range is pulled down" {
    try testing.expectEqual(100, game.clampGuess(140));
}

// task_id = 4
test "the ends of the range are in range" {
    try testing.expectEqual(1, game.clampGuess(1));
    try testing.expectEqual(100, game.clampGuess(100));
}
