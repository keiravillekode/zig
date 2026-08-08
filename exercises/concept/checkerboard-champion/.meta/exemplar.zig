const board_size = 8;

pub fn emptyRow() [board_size]u8 {
    return [_]u8{'.'} ** board_size;
}

pub fn squareCount(board: [board_size][board_size]u8) usize {
    return board.len * board[0].len;
}

pub fn countPieces(board: [board_size][board_size]u8, piece: u8) u32 {
    var found: u32 = 0;
    for (board) |row| {
        for (row) |square| {
            if (square == piece) found += 1;
        }
    }
    return found;
}

pub fn diagonal(board: [board_size][board_size]u8) [board_size]u8 {
    var result: [board_size]u8 = undefined;
    for (0..board_size) |index| {
        result[index] = board[index][index];
    }
    return result;
}
