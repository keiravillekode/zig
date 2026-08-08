const std = @import("std");
const testing = std.testing;

const room = @import("sorting_room_shift.zig");

// task 1
test "a label is copied" {
    const copy = try room.copyLabel(testing.allocator, "PARIS");
    defer testing.allocator.free(copy);
    try testing.expectEqualStrings("PARIS", copy);
}

test "the copy is memory of its own" {
    const label = "PARIS";
    const copy = try room.copyLabel(testing.allocator, label);
    defer testing.allocator.free(copy);
    try testing.expect(copy.ptr != label.ptr);
}

test "an empty label" {
    const copy = try room.copyLabel(testing.allocator, "");
    defer testing.allocator.free(copy);
    try testing.expectEqualStrings("", copy);
}

// task 2
test "a blank tag of four" {
    const tag = try room.blankTag(testing.allocator, 4);
    defer testing.allocator.free(tag);
    try testing.expectEqualStrings("....", tag);
}

test "a blank tag of one" {
    const tag = try room.blankTag(testing.allocator, 1);
    defer testing.allocator.free(tag);
    try testing.expectEqualStrings(".", tag);
}

test "a blank tag of nothing" {
    const tag = try room.blankTag(testing.allocator, 0);
    defer testing.allocator.free(tag);
    try testing.expectEqualStrings("", tag);
}

// task 3
test "two labels are joined" {
    const joined = try room.joinLabels(testing.allocator, "PAR", "IS");
    defer testing.allocator.free(joined);
    try testing.expectEqualStrings("PARIS", joined);
}

test "joining onto an empty label" {
    const joined = try room.joinLabels(testing.allocator, "", "IS");
    defer testing.allocator.free(joined);
    try testing.expectEqualStrings("IS", joined);
}

test "joining two empty labels" {
    const joined = try room.joinLabels(testing.allocator, "", "");
    defer testing.allocator.free(joined);
    try testing.expectEqualStrings("", joined);
}

// task 4
test "a label repeated three times" {
    const repeated = try room.repeatLabel(testing.allocator, "AB", 3);
    defer testing.allocator.free(repeated);
    try testing.expectEqualStrings("ABABAB", repeated);
}

test "a label repeated once" {
    const repeated = try room.repeatLabel(testing.allocator, "AB", 1);
    defer testing.allocator.free(repeated);
    try testing.expectEqualStrings("AB", repeated);
}

test "a label repeated no times" {
    const repeated = try room.repeatLabel(testing.allocator, "AB", 0);
    defer testing.allocator.free(repeated);
    try testing.expectEqualStrings("", repeated);
}

test "repeating survives a failing allocator" {
    try testing.checkAllAllocationFailures(testing.allocator, struct {
        fn check(allocator: std.mem.Allocator) !void {
            const repeated = try room.repeatLabel(allocator, "AB", 3);
            defer allocator.free(repeated);
            try testing.expectEqualStrings("ABABAB", repeated);
        }
    }.check, .{});
}
