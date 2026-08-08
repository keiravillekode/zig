const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn collect(allocator: Allocator, tracks: []const []const u8) ![][]const u8 {
    _ = tracks;
    return allocator.alloc([]const u8, 0);
}

pub fn withoutBanned(allocator: Allocator, tracks: []const []const u8, banned: []const u8) ![][]const u8 {
    _ = tracks;
    _ = banned;
    return allocator.alloc([]const u8, 0);
}

pub fn repeatTrack(allocator: Allocator, track: []const u8, count: usize) ![][]const u8 {
    _ = track;
    _ = count;
    return allocator.alloc([]const u8, 0);
}

pub fn interleave(allocator: Allocator, first: []const []const u8, second: []const []const u8) ![][]const u8 {
    _ = first;
    _ = second;
    return allocator.alloc([]const u8, 0);
}
