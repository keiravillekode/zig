const std = @import("std");
const testing = std.testing;

const till = @import("tech_palace_opening.zig");

// task_id = 1
test "the doors open at nine" {
    try testing.expectEqual(9, till.openingHour());
}

// task_id = 2
test "the shop is open for twelve hours" {
    try testing.expectEqual(12, till.hoursOpenEachDay());
}

// task_id = 3
test "a bundle of one television" {
    try testing.expectEqual(899, till.bundleCost(1, 0));
}

// task_id = 3
test "a bundle of speakers only" {
    try testing.expectEqual(387, till.bundleCost(0, 3));
}

// task_id = 3
test "a mixed bundle" {
    try testing.expectEqual(1157, till.bundleCost(1, 2));
}

// task_id = 3
test "an empty bundle is free" {
    try testing.expectEqual(0, till.bundleCost(0, 0));
}

// task_id = 4
test "a modest discount is left alone" {
    try testing.expectEqual(15, till.cappedDiscount(15));
}

// task_id = 4
test "a discount at the cap is left alone" {
    try testing.expectEqual(50, till.cappedDiscount(50));
}

// task_id = 4
test "an outrageous discount is capped" {
    try testing.expectEqual(50, till.cappedDiscount(80));
}
