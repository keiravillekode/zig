const std = @import("std");
const testing = std.testing;

const trip = @import("road_trip_playlist.zig");

// task_id = 1
test "collecting two tracks" {
    const playlist = try trip.collect(testing.allocator, &.{ "Blue Monday", "Roadrunner" });
    defer testing.allocator.free(playlist);
    try testing.expectEqual(2, playlist.len);
    try testing.expectEqualStrings("Blue Monday", playlist[0]);
    try testing.expectEqualStrings("Roadrunner", playlist[1]);
}

// task_id = 1
test "collecting nothing" {
    const playlist = try trip.collect(testing.allocator, &.{});
    defer testing.allocator.free(playlist);
    try testing.expectEqual(0, playlist.len);
}

// task_id = 2
test "the banned track is left out" {
    const playlist = try trip.withoutBanned(testing.allocator, &.{ "Blue Monday", "Barbie Girl" }, "Barbie Girl");
    defer testing.allocator.free(playlist);
    try testing.expectEqual(1, playlist.len);
    try testing.expectEqualStrings("Blue Monday", playlist[0]);
}

// task_id = 2
test "every copy of the banned track goes" {
    const playlist = try trip.withoutBanned(testing.allocator, &.{ "a", "b", "a", "c", "a" }, "a");
    defer testing.allocator.free(playlist);
    try testing.expectEqual(2, playlist.len);
    try testing.expectEqualStrings("b", playlist[0]);
    try testing.expectEqualStrings("c", playlist[1]);
}

// task_id = 2
test "a track nobody banned survives" {
    const playlist = try trip.withoutBanned(testing.allocator, &.{ "a", "b" }, "z");
    defer testing.allocator.free(playlist);
    try testing.expectEqual(2, playlist.len);
}

// task_id = 3
test "a track on repeat" {
    const playlist = try trip.repeatTrack(testing.allocator, "Blue Monday", 3);
    defer testing.allocator.free(playlist);
    try testing.expectEqual(3, playlist.len);
    try testing.expectEqualStrings("Blue Monday", playlist[2]);
}

// task_id = 3
test "a track played once" {
    const playlist = try trip.repeatTrack(testing.allocator, "Blue Monday", 1);
    defer testing.allocator.free(playlist);
    try testing.expectEqual(1, playlist.len);
}

// task_id = 3
test "a track played no times" {
    const playlist = try trip.repeatTrack(testing.allocator, "Blue Monday", 0);
    defer testing.allocator.free(playlist);
    try testing.expectEqual(0, playlist.len);
}

// task_id = 4
test "two lists of the same length alternate" {
    const playlist = try trip.interleave(testing.allocator, &.{ "a", "c" }, &.{ "b", "d" });
    defer testing.allocator.free(playlist);
    try testing.expectEqual(4, playlist.len);
    try testing.expectEqualStrings("a", playlist[0]);
    try testing.expectEqualStrings("b", playlist[1]);
    try testing.expectEqualStrings("c", playlist[2]);
    try testing.expectEqualStrings("d", playlist[3]);
}

// task_id = 4
test "the longer list finishes on its own" {
    const playlist = try trip.interleave(testing.allocator, &.{ "a", "c" }, &.{ "b", "d", "e" });
    defer testing.allocator.free(playlist);
    try testing.expectEqual(5, playlist.len);
    try testing.expectEqualStrings("e", playlist[4]);
}

// task_id = 4
test "an empty first list" {
    const playlist = try trip.interleave(testing.allocator, &.{}, &.{ "b", "d" });
    defer testing.allocator.free(playlist);
    try testing.expectEqual(2, playlist.len);
    try testing.expectEqualStrings("b", playlist[0]);
}

// task_id = 4
test "two empty lists" {
    const playlist = try trip.interleave(testing.allocator, &.{}, &.{});
    defer testing.allocator.free(playlist);
    try testing.expectEqual(0, playlist.len);
}

// task_id = 4
test "interleaving survives a failing allocator" {
    try testing.checkAllAllocationFailures(testing.allocator, struct {
        fn check(allocator: std.mem.Allocator) !void {
            const playlist = try trip.interleave(allocator, &.{ "a", "c" }, &.{ "b", "d", "e" });
            defer allocator.free(playlist);
            try testing.expectEqual(5, playlist.len);
        }
    }.check, .{});
}
