const std = @import("std");
const testing = std.testing;

const draughts = @import("checkerboard_champion.zig");

const starting_board = [8][8]u8{
    [_]u8{ '.', 'b', '.', 'b', '.', 'b', '.', 'b' },
    [_]u8{ 'b', '.', 'b', '.', 'b', '.', 'b', '.' },
    [_]u8{ '.', 'b', '.', 'b', '.', 'b', '.', 'b' },
    [_]u8{'.'} ** 8,
    [_]u8{'.'} ** 8,
    [_]u8{ 'w', '.', 'w', '.', 'w', '.', 'w', '.' },
    [_]u8{ '.', 'w', '.', 'w', '.', 'w', '.', 'w' },
    [_]u8{ 'w', '.', 'w', '.', 'w', '.', 'w', '.' },
};

const empty_board = [_][8]u8{[_]u8{'.'} ** 8} ** 8;

// A board contrived so that every square on the long diagonal is occupied.
const marked_board = [8][8]u8{
    [_]u8{ 'w', '.', '.', '.', '.', '.', '.', '.' },
    [_]u8{ '.', 'b', '.', '.', '.', '.', '.', '.' },
    [_]u8{ '.', '.', 'w', '.', '.', '.', '.', '.' },
    [_]u8{ '.', '.', '.', 'b', '.', '.', '.', '.' },
    [_]u8{ '.', '.', '.', '.', 'w', '.', '.', '.' },
    [_]u8{ '.', '.', '.', '.', '.', 'b', '.', '.' },
    [_]u8{ '.', '.', '.', '.', '.', '.', 'w', '.' },
    [_]u8{ '.', '.', '.', '.', '.', '.', '.', 'b' },
};

// task 1
test "an empty row is eight dots" {
    try testing.expectEqualSlices(u8, "........", &draughts.emptyRow());
}

test "an empty row has eight squares" {
    try testing.expectEqual(8, draughts.emptyRow().len);
}

// task 2
test "a board has sixty four squares" {
    try testing.expectEqual(64, draughts.squareCount(starting_board));
}

test "an empty board has just as many" {
    try testing.expectEqual(64, draughts.squareCount(empty_board));
}

// task 3
test "counting the white pieces at the start" {
    try testing.expectEqual(12, draughts.countPieces(starting_board, 'w'));
}

test "counting the black pieces at the start" {
    try testing.expectEqual(12, draughts.countPieces(starting_board, 'b'));
}

test "counting the empty squares at the start" {
    try testing.expectEqual(40, draughts.countPieces(starting_board, '.'));
}

test "counting a piece that is not on the board" {
    try testing.expectEqual(0, draughts.countPieces(starting_board, 'k'));
}

// task 4
test "the diagonal picks one square from each row" {
    try testing.expectEqualSlices(u8, "wbwbwbwb", &draughts.diagonal(marked_board));
}

test "the starting board leaves the long diagonal clear" {
    try testing.expectEqualSlices(u8, "........", &draughts.diagonal(starting_board));
}

test "the diagonal of an empty board is all dots" {
    try testing.expectEqualSlices(u8, "........", &draughts.diagonal(empty_board));
}
