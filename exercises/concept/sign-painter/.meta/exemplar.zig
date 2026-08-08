const std = @import("std");

const pence_per_character = 3;

pub fn letterCount(sign: []const u8) usize {
    return sign.len;
}

pub fn saysOpen(sign: []const u8) bool {
    return std.mem.eql(u8, sign, "OPEN");
}

pub fn isForSale(sign: []const u8) bool {
    return std.mem.startsWith(u8, sign, "FOR SALE");
}

pub fn paintCost(sign: []const u8) u32 {
    var painted: u32 = 0;
    for (sign) |character| {
        if (character != ' ') painted += 1;
    }
    return painted * pence_per_character;
}
