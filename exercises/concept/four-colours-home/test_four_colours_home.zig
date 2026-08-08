const std = @import("std");
const testing = std.testing;

const game = @import("four_colours_home.zig");
const Colour = game.Colour;

// task 1
test "green starts at the beginning" {
    try testing.expectEqual(0, game.startSquare(.green));
}

test "red starts a quarter of the way round" {
    try testing.expectEqual(13, game.startSquare(.red));
}

test "blue starts halfway round" {
    try testing.expectEqual(26, game.startSquare(.blue));
}

test "yellow starts three quarters of the way round" {
    try testing.expectEqual(39, game.startSquare(.yellow));
}

// task 2
test "red follows green" {
    try testing.expectEqual(Colour.red, game.nextPlayer(.green));
}

test "blue follows red" {
    try testing.expectEqual(Colour.blue, game.nextPlayer(.red));
}

test "yellow follows blue" {
    try testing.expectEqual(Colour.yellow, game.nextPlayer(.blue));
}

test "play wraps back round to green" {
    try testing.expectEqual(Colour.green, game.nextPlayer(.yellow));
}

// task 3
test "naming red" {
    try testing.expectEqualStrings("red", game.colourName(.red));
}

test "naming yellow" {
    try testing.expectEqualStrings("yellow", game.colourName(.yellow));
}

// task 4
test "green and yellow are partners" {
    try testing.expect(game.arePartners(.green, .yellow));
}

test "partnership works both ways round" {
    try testing.expect(game.arePartners(.yellow, .green));
}

test "red and blue are partners" {
    try testing.expect(game.arePartners(.red, .blue));
}

test "green and red are opponents" {
    try testing.expect(!game.arePartners(.green, .red));
}

test "blue and yellow are opponents" {
    try testing.expect(!game.arePartners(.blue, .yellow));
}

test "a player is not their own partner" {
    try testing.expect(!game.arePartners(.green, .green));
}
