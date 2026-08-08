pub fn totalWeight(first: u8, second: u8, third: u8) u32 {
    return @as(u32, first) + second + third;
}

pub fn displayWeight(total: u32) u16 {
    return @intCast(total);
}

pub fn checksumByte(total: u32) u8 {
    return @truncate(total);
}

pub fn isOverloaded(total: u32, limit: u16) bool {
    return total > limit;
}
