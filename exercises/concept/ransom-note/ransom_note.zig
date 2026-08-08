const std = @import("std");
const Allocator = std.mem.Allocator;

pub const Counts = std.AutoHashMap(u8, u32);

pub fn letterCounts(allocator: Allocator, text: []const u8) !Counts {
    _ = text;
    return Counts.init(allocator);
}

pub fn countOf(counts: *const Counts, letter: u8) u32 {
    _ = counts;
    _ = letter;
    return 0;
}

pub fn distinctLetters(allocator: Allocator, text: []const u8) !u32 {
    _ = allocator;
    _ = text;
    return 0;
}

pub fn canCut(allocator: Allocator, note: []const u8, magazine: []const u8) !bool {
    _ = allocator;
    _ = note;
    _ = magazine;
    return false;
}
