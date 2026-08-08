const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn copyLabel(allocator: Allocator, label: []const u8) ![]u8 {
    _ = label;
    return allocator.alloc(u8, 0);
}

pub fn blankTag(allocator: Allocator, length: usize) ![]u8 {
    _ = length;
    return allocator.alloc(u8, 0);
}

pub fn joinLabels(allocator: Allocator, first: []const u8, second: []const u8) ![]u8 {
    _ = first;
    _ = second;
    return allocator.alloc(u8, 0);
}

pub fn repeatLabel(allocator: Allocator, label: []const u8, count: usize) ![]u8 {
    _ = label;
    _ = count;
    return allocator.alloc(u8, 0);
}
