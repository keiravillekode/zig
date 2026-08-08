pub fn sliceCount(pizza: []const u8) usize {
    return pizza.len;
}

pub fn firstHalf(pizza: []const u8) []const u8 {
    return pizza[0 .. pizza.len / 2];
}

pub fn portion(pizza: []const u8, start: usize, end: usize) []const u8 {
    return pizza[start..end];
}

pub fn markSold(tray: []u8) void {
    for (tray) |*slot| {
        slot.* = 'x';
    }
}
