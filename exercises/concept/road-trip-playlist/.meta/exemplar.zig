const std = @import("std");
const Allocator = std.mem.Allocator;

const Playlist = std.ArrayList([]const u8);

pub fn collect(allocator: Allocator, tracks: []const []const u8) ![][]const u8 {
    var playlist: Playlist = .empty;
    errdefer playlist.deinit(allocator);

    try playlist.appendSlice(allocator, tracks);
    return playlist.toOwnedSlice(allocator);
}

pub fn withoutBanned(allocator: Allocator, tracks: []const []const u8, banned: []const u8) ![][]const u8 {
    var playlist: Playlist = .empty;
    errdefer playlist.deinit(allocator);

    for (tracks) |track| {
        if (std.mem.eql(u8, track, banned)) continue;
        try playlist.append(allocator, track);
    }
    return playlist.toOwnedSlice(allocator);
}

pub fn repeatTrack(allocator: Allocator, track: []const u8, count: usize) ![][]const u8 {
    var playlist: Playlist = .empty;
    errdefer playlist.deinit(allocator);

    try playlist.appendNTimes(allocator, track, count);
    return playlist.toOwnedSlice(allocator);
}

pub fn interleave(allocator: Allocator, first: []const []const u8, second: []const []const u8) ![][]const u8 {
    var playlist: Playlist = .empty;
    errdefer playlist.deinit(allocator);

    var index: usize = 0;
    while (index < first.len or index < second.len) : (index += 1) {
        if (index < first.len) try playlist.append(allocator, first[index]);
        if (index < second.len) try playlist.append(allocator, second[index]);
    }
    return playlist.toOwnedSlice(allocator);
}
