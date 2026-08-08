const orchard_rows = 100;

pub fn treesInOrchard(rows: u32) u32 {
    var total: u32 = 0;
    for (1..rows + 1) |row| {
        total += @intCast(row);
    }
    return total;
}

pub fn roundsNeeded(trees: u32, per_round: u32) u32 {
    var remaining = trees;
    var rounds: u32 = 0;
    while (remaining > 0) : (rounds += 1) {
        remaining -|= per_round;
    }
    return rounds;
}

pub fn rowsWorked(rows: u32) u32 {
    var worked: u32 = 0;
    for (1..rows + 1) |row| {
        if (row % 3 == 0) continue;
        worked += 1;
    }
    return worked;
}

pub fn rowsUntilBasketFull(capacity: u32) u32 {
    var apples: u32 = 0;
    var rows: u32 = 0;
    for (1..orchard_rows + 1) |row| {
        rows += 1;
        apples += @intCast(row);
        if (apples >= capacity) break;
    }
    return rows;
}
