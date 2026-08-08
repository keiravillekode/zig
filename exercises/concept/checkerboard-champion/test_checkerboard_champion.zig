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

// task_id = 1
test "an empty row is eight dots" {
    try testing.expectEqualSlices(u8, "........", &draughts.emptyRow());
}

// task_id = 1
test "an empty row has eight squares" {
    try testing.expectEqual(8, draughts.emptyRow().len);
}

// task_id = 2
test "a board has sixty four squares" {
    try testing.expectEqual(64, draughts.squareCount(starting_board));
}

// task_id = 2
test "an empty board has just as many" {
    try testing.expectEqual(64, draughts.squareCount(empty_board));
}

// task_id = 3
test "counting the white pieces at the start" {
    try testing.expectEqual(12, draughts.countPieces(starting_board, 'w'));
}

// task_id = 3
test "counting the black pieces at the start" {
    try testing.expectEqual(12, draughts.countPieces(starting_board, 'b'));
}

// task_id = 3
test "counting the empty squares at the start" {
    try testing.expectEqual(40, draughts.countPieces(starting_board, '.'));
}

// task_id = 3
test "counting a piece that is not on the board" {
    try testing.expectEqual(0, draughts.countPieces(starting_board, 'k'));
}

// task_id = 4
test "the diagonal picks one square from each row" {
    try testing.expectEqualSlices(u8, "wbwbwbwb", &draughts.diagonal(marked_board));
}

// task_id = 4
test "the starting board leaves the long diagonal clear" {
    try testing.expectEqualSlices(u8, "........", &draughts.diagonal(starting_board));
}

// task_id = 4
test "the diagonal of an empty board is all dots" {
    try testing.expectEqualSlices(u8, "........", &draughts.diagonal(empty_board));
}
