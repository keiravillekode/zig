const std = @import("std");
const testing = std.testing;

const office = @import("lost_property_office.zig");

// task 1
test "an item with a known owner" {
    try testing.expectEqual(17, office.ownerOrUnknown(17));
}

test "an item with no owner recorded" {
    try testing.expectEqual(0, office.ownerOrUnknown(null));
}

test "a membership number of zero is still a membership number" {
    try testing.expectEqual(0, office.ownerOrUnknown(0));
}

// task 2
test "an item with an owner has been claimed" {
    try testing.expect(office.isClaimed(17));
}

test "an item without an owner has not been claimed" {
    try testing.expect(!office.isClaimed(null));
}

test "membership number zero counts as claimed" {
    try testing.expect(office.isClaimed(0));
}

// task 3
test "finding a code in the middle" {
    try testing.expectEqual(1, office.find(&[_]u32{ 40, 41, 42 }, 41));
}

test "finding the first code" {
    try testing.expectEqual(0, office.find(&[_]u32{ 40, 41, 42 }, 40));
}

test "finding the last code" {
    try testing.expectEqual(2, office.find(&[_]u32{ 40, 41, 42 }, 42));
}

test "a code that is not in the ledger" {
    try testing.expectEqual(null, office.find(&[_]u32{ 40, 41, 42 }, 99));
}

test "an empty ledger finds nothing" {
    try testing.expectEqual(null, office.find(&[_]u32{}, 40));
}

test "the first of two matching codes wins" {
    try testing.expectEqual(0, office.find(&[_]u32{ 42, 42 }, 42));
}

// task 4
test "the first week is free" {
    try testing.expectEqual(0, office.feeFor(7));
}

test "the eighth day costs fifty pence" {
    try testing.expectEqual(50, office.feeFor(8));
}

test "ten days costs for three of them" {
    try testing.expectEqual(150, office.feeFor(10));
}

test "an unrecorded arrival is free" {
    try testing.expectEqual(0, office.feeFor(null));
}
