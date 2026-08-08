const std = @import("std");
const testing = std.testing;

const painter = @import("sign_painter.zig");

// task_id = 1
test "a short sign" {
    try testing.expectEqual(4, painter.letterCount("OPEN"));
}

// task_id = 1
test "spaces are bytes too" {
    try testing.expectEqual(8, painter.letterCount("FOR SALE"));
}

// task_id = 1
test "a blank sign" {
    try testing.expectEqual(0, painter.letterCount(""));
}

// task_id = 2
test "an open sign" {
    try testing.expect(painter.saysOpen("OPEN"));
}

// task_id = 2
test "a closed sign is not an open sign" {
    try testing.expect(!painter.saysOpen("CLOSED"));
}

// task_id = 2
test "a longer sign that begins with OPEN does not count" {
    try testing.expect(!painter.saysOpen("OPEN ALL HOURS"));
}

// task_id = 2
test "case matters" {
    try testing.expect(!painter.saysOpen("open"));
}

// task_id = 3
test "a plain for sale board" {
    try testing.expect(painter.isForSale("FOR SALE"));
}

// task_id = 3
test "a for sale board with more to say" {
    try testing.expect(painter.isForSale("FOR SALE BY AUCTION"));
}

// task_id = 3
test "a sold board is not for sale" {
    try testing.expect(!painter.isForSale("SOLD"));
}

// task_id = 3
test "a board that mentions a sale later does not count" {
    try testing.expect(!painter.isForSale("NOT FOR SALE"));
}

// task_id = 4
test "a sign with no spaces" {
    try testing.expectEqual(12, painter.paintCost("OPEN"));
}

// task_id = 4
test "spaces are free" {
    try testing.expectEqual(21, painter.paintCost("FOR SALE"));
}

// task_id = 4
test "a sign of nothing but spaces costs nothing" {
    try testing.expectEqual(0, painter.paintCost("   "));
}

// task_id = 4
test "a blank sign costs nothing" {
    try testing.expectEqual(0, painter.paintCost(""));
}
