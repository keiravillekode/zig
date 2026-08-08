const std = @import("std");
const testing = std.testing;

const painter = @import("sign_painter.zig");

// task 1
test "a short sign" {
    try testing.expectEqual(4, painter.letterCount("OPEN"));
}

test "spaces are bytes too" {
    try testing.expectEqual(8, painter.letterCount("FOR SALE"));
}

test "a blank sign" {
    try testing.expectEqual(0, painter.letterCount(""));
}

// task 2
test "an open sign" {
    try testing.expect(painter.saysOpen("OPEN"));
}

test "a closed sign is not an open sign" {
    try testing.expect(!painter.saysOpen("CLOSED"));
}

test "a longer sign that begins with OPEN does not count" {
    try testing.expect(!painter.saysOpen("OPEN ALL HOURS"));
}

test "case matters" {
    try testing.expect(!painter.saysOpen("open"));
}

// task 3
test "a plain for sale board" {
    try testing.expect(painter.isForSale("FOR SALE"));
}

test "a for sale board with more to say" {
    try testing.expect(painter.isForSale("FOR SALE BY AUCTION"));
}

test "a sold board is not for sale" {
    try testing.expect(!painter.isForSale("SOLD"));
}

test "a board that mentions a sale later does not count" {
    try testing.expect(!painter.isForSale("NOT FOR SALE"));
}

// task 4
test "a sign with no spaces" {
    try testing.expectEqual(12, painter.paintCost("OPEN"));
}

test "spaces are free" {
    try testing.expectEqual(21, painter.paintCost("FOR SALE"));
}

test "a sign of nothing but spaces costs nothing" {
    try testing.expectEqual(0, painter.paintCost("   "));
}

test "a blank sign costs nothing" {
    try testing.expectEqual(0, painter.paintCost(""));
}
