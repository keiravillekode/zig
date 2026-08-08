const std = @import("std");
const testing = std.testing;

const shop = @import("slice_shop.zig");

// task 1
test "a whole pizza" {
    try testing.expectEqual(5, shop.sliceCount("mmpph"));
}

test "a single slice" {
    try testing.expectEqual(1, shop.sliceCount("m"));
}

test "no pizza at all" {
    try testing.expectEqual(0, shop.sliceCount(""));
}

// task 2
test "half of an even pizza" {
    try testing.expectEqualStrings("mm", shop.firstHalf("mmpp"));
}

test "half of an odd pizza rounds down" {
    try testing.expectEqualStrings("mm", shop.firstHalf("mmpph"));
}

test "half of nothing is nothing" {
    try testing.expectEqualStrings("", shop.firstHalf(""));
}

// task 3
test "a portion from the middle" {
    try testing.expectEqualStrings("mpp", shop.portion("mmpph", 1, 4));
}

test "a portion from the start" {
    try testing.expectEqualStrings("mm", shop.portion("mmpph", 0, 2));
}

test "a portion running to the end" {
    try testing.expectEqualStrings("ph", shop.portion("mmpph", 3, 5));
}

test "an empty portion" {
    try testing.expectEqualStrings("", shop.portion("mmpph", 2, 2));
}

// task 4
test "a whole tray is marked" {
    var tray = [_]u8{ 'm', 'p', 'h' };
    shop.markSold(&tray);
    try testing.expectEqualSlices(u8, "xxx", &tray);
}

test "marking part of a tray leaves the rest alone" {
    var tray = [_]u8{ 'm', 'p', 'h', 'p' };
    shop.markSold(tray[1..3]);
    try testing.expectEqualSlices(u8, "mxxp", &tray);
}

test "an empty tray is left alone" {
    var tray = [_]u8{};
    shop.markSold(&tray);
    try testing.expectEqual(0, tray.len);
}
