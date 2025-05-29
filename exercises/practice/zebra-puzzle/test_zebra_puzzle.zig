const std = @import("std");
const testing = std.testing;

const zebra_puzzle = @import("zebra_puzzle.zig");

test "resident who drinks water" {
    const solution = try zebra_puzzle.solvePuzzle(testing.allocator);
    try testing.expectEqual(.norwegian, solution.drinks_water);
}

test "resident who owns zebra" {
    const solution = try zebra_puzzle.solvePuzzle(testing.allocator);
    try testing.expectEqual(.japanese, solution.owns_zebra);
}
