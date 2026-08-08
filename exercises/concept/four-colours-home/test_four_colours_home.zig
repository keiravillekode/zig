const std = @import("std");
const testing = std.testing;

const game = @import("four_colours_home.zig");
const Colour = game.Colour;

// task_id = 1
test "green starts at the beginning" {
    try testing.expectEqual(0, game.startSquare(.green));
}

// task_id = 1
test "red starts a quarter of the way round" {
    try testing.expectEqual(13, game.startSquare(.red));
}

// task_id = 1
test "blue starts halfway round" {
    try testing.expectEqual(26, game.startSquare(.blue));
}

// task_id = 1
test "yellow starts three quarters of the way round" {
    try testing.expectEqual(39, game.startSquare(.yellow));
}

// task_id = 2
test "red follows green" {
    try testing.expectEqual(Colour.red, game.nextPlayer(.green));
}

// task_id = 2
test "blue follows red" {
    try testing.expectEqual(Colour.blue, game.nextPlayer(.red));
}

// task_id = 2
test "yellow follows blue" {
    try testing.expectEqual(Colour.yellow, game.nextPlayer(.blue));
}

// task_id = 2
test "play wraps back round to green" {
    try testing.expectEqual(Colour.green, game.nextPlayer(.yellow));
}

// task_id = 3
test "naming red" {
    try testing.expectEqualStrings("red", game.colourName(.red));
}

// task_id = 3
test "naming yellow" {
    try testing.expectEqualStrings("yellow", game.colourName(.yellow));
}

// task_id = 4
test "green and yellow are partners" {
    try testing.expect(game.arePartners(.green, .yellow));
}

// task_id = 4
test "partnership works both ways round" {
    try testing.expect(game.arePartners(.yellow, .green));
}

// task_id = 4
test "red and blue are partners" {
    try testing.expect(game.arePartners(.red, .blue));
}

// task_id = 4
test "green and red are opponents" {
    try testing.expect(!game.arePartners(.green, .red));
}

// task_id = 4
test "blue and yellow are opponents" {
    try testing.expect(!game.arePartners(.blue, .yellow));
}

// task_id = 4
test "a player is not their own partner" {
    try testing.expect(!game.arePartners(.green, .green));
}
