const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn copyLabel(allocator: Allocator, label: []const u8) ![]u8 {
    return allocator.dupe(u8, label);
}

pub fn blankTag(allocator: Allocator, length: usize) ![]u8 {
    const tag = try allocator.alloc(u8, length);
    @memset(tag, '.');
    return tag;
}

pub fn joinLabels(allocator: Allocator, first: []const u8, second: []const u8) ![]u8 {
    const joined = try allocator.alloc(u8, first.len + second.len);
    @memcpy(joined[0..first.len], first);
    @memcpy(joined[first.len..], second);
    return joined;
}

pub fn repeatLabel(allocator: Allocator, label: []const u8, count: usize) ![]u8 {
    const repeated = try allocator.alloc(u8, label.len * count);
    for (0..count) |index| {
        const start = index * label.len;
        @memcpy(repeated[start .. start + label.len], label);
    }
    return repeated;
}
