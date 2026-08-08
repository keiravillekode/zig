const palette_size = 16;

pub fn palette() [palette_size]u8 {
    return [_]u8{0} ** palette_size;
}

pub fn tiles(comptime count: usize, value: u8) [count]u8 {
    _ = value;
    return [_]u8{0} ** count;
}

pub fn bitsNeeded(comptime highest: u32) u32 {
    _ = highest;
    return 0;
}

pub fn paletteChecksum() u8 {
    return 0;
}
