const palette_size = 16;

pub fn palette() [palette_size]u8 {
    return comptime blk: {
        var table: [palette_size]u8 = undefined;
        for (0..palette_size) |index| {
            table[index] = @intCast(index * 17);
        }
        break :blk table;
    };
}

pub fn tiles(comptime count: usize, value: u8) [count]u8 {
    return [_]u8{value} ** count;
}

pub fn bitsNeeded(comptime highest: u32) u32 {
    return comptime blk: {
        var remaining = highest;
        var bits: u32 = 0;
        while (remaining > 0) : (bits += 1) {
            remaining /= 2;
        }
        break :blk bits;
    };
}

pub fn paletteChecksum() u8 {
    return comptime blk: {
        var total: u8 = 0;
        for (palette()) |entry| {
            total +%= entry;
        }
        break :blk total;
    };
}
