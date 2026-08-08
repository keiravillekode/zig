const board_size = 8;

pub fn emptyRow() [board_size]u8 {
    return [_]u8{'?'} ** board_size;
}

pub fn squareCount(board: [board_size][board_size]u8) usize {
    _ = board;
    return 0;
}

pub fn countPieces(board: [board_size][board_size]u8, piece: u8) u32 {
    _ = board;
    _ = piece;
    return 0;
}

pub fn diagonal(board: [board_size][board_size]u8) [board_size]u8 {
    _ = board;
    return [_]u8{'?'} ** board_size;
}
