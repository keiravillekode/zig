const std = @import("std");
const Allocator = std.mem.Allocator;

pub const Counts = std.AutoHashMap(u8, u32);

pub fn letterCounts(allocator: Allocator, text: []const u8) !Counts {
    var counts = Counts.init(allocator);
    errdefer counts.deinit();

    for (text) |letter| {
        if (letter == ' ') continue;
        const entry = try counts.getOrPut(letter);
        if (!entry.found_existing) entry.value_ptr.* = 0;
        entry.value_ptr.* += 1;
    }
    return counts;
}

pub fn countOf(counts: *const Counts, letter: u8) u32 {
    return counts.get(letter) orelse 0;
}

pub fn distinctLetters(allocator: Allocator, text: []const u8) !u32 {
    var counts = try letterCounts(allocator, text);
    defer counts.deinit();

    return counts.count();
}

pub fn canCut(allocator: Allocator, note: []const u8, magazine: []const u8) !bool {
    var needed = try letterCounts(allocator, note);
    defer needed.deinit();

    var available = try letterCounts(allocator, magazine);
    defer available.deinit();

    var it = needed.iterator();
    while (it.next()) |entry| {
        if (countOf(&available, entry.key_ptr.*) < entry.value_ptr.*) return false;
    }
    return true;
}
