const std = @import("std");
const testing = std.testing;

const toolbox = @import("pocket_toolbox.zig");

// task_id = 1
test "the smallest is first" {
    try testing.expectEqual(-3, toolbox.smallest(-3, 5, 7));
}

// task_id = 1
test "the smallest is last" {
    try testing.expectEqual(1, toolbox.smallest(9, 5, 1));
}

// task_id = 1
test "all three the same" {
    try testing.expectEqual(4, toolbox.smallest(4, 4, 4));
}

// task_id = 2
test "a gap across zero" {
    try testing.expectEqual(8, toolbox.gap(-3, 5));
}

// task_id = 2
test "the same gap the other way round" {
    try testing.expectEqual(8, toolbox.gap(5, -3));
}

// task_id = 2
test "no gap at all" {
    try testing.expectEqual(0, toolbox.gap(7, 7));
}

// task_id = 2
test "a gap between two negative readings" {
    try testing.expectEqual(4, toolbox.gap(-9, -5));
}

// task_id = 3
test "three flags raised" {
    try testing.expectEqual(3, toolbox.flagsRaised(0b1010_0100));
}

// task_id = 3
test "no flags raised" {
    try testing.expectEqual(0, toolbox.flagsRaised(0b0000_0000));
}

// task_id = 3
test "every flag raised" {
    try testing.expectEqual(8, toolbox.flagsRaised(0b1111_1111));
}

// task_id = 4
test "an addition that overflows" {
    try testing.expect(toolbox.wouldOverflow(250, 10));
}

// task_id = 4
test "an addition that fits" {
    try testing.expect(!toolbox.wouldOverflow(100, 100));
}

// task_id = 4
test "an addition that exactly fills the byte" {
    try testing.expect(!toolbox.wouldOverflow(250, 5));
}

// task_id = 4
test "one past the top of the byte" {
    try testing.expect(toolbox.wouldOverflow(250, 6));
}
