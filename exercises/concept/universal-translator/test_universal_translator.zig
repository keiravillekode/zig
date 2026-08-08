const std = @import("std");
const testing = std.testing;

const translator = @import("universal_translator.zig");

// task_id = 1
test "the first of several readings" {
    try testing.expectEqual(7, translator.firstOr(u32, &[_]u32{ 7, 8 }, 0));
}

// task_id = 1
test "the fallback when there are no readings" {
    try testing.expectEqual(0, translator.firstOr(u32, &[_]u32{}, 0));
}

// task_id = 1
test "the same function works on bytes" {
    try testing.expectEqual('a', translator.firstOr(u8, "abc", '?'));
}

// task_id = 1
test "the fallback comes back for an empty string" {
    try testing.expectEqual('?', translator.firstOr(u8, "", '?'));
}

// task_id = 2
test "counting a repeated byte" {
    try testing.expectEqual(5, translator.countMatching(u8, "abracadabra", 'a'));
}

// task_id = 2
test "counting something that is not there" {
    try testing.expectEqual(0, translator.countMatching(u8, "abracadabra", 'z'));
}

// task_id = 2
test "counting numbers" {
    try testing.expectEqual(2, translator.countMatching(u32, &[_]u32{ 3, 9, 3 }, 3));
}

// task_id = 2
test "counting in an empty list" {
    try testing.expectEqual(0, translator.countMatching(u32, &[_]u32{}, 3));
}

// task_id = 3
test "the largest of several readings" {
    try testing.expectEqual(9, translator.largest(u32, &[_]u32{ 3, 9, 4 }));
}

// task_id = 3
test "the largest is the first" {
    try testing.expectEqual(9, translator.largest(u32, &[_]u32{ 9, 3, 4 }));
}

// task_id = 3
test "a single reading is the largest" {
    try testing.expectEqual(3, translator.largest(u32, &[_]u32{3}));
}

// task_id = 3
test "an empty list has no largest" {
    try testing.expectEqual(null, translator.largest(u32, &[_]u32{}));
}

// task_id = 3
test "the largest byte" {
    try testing.expectEqual('r', translator.largest(u8, "abracadabra"));
}

// task_id = 4
test "a box holds a number" {
    const boxed = translator.Box(u32){ .value = 10 };
    try testing.expectEqual(10, boxed.get());
}

// task_id = 4
test "a box holds a byte" {
    const boxed = translator.Box(u8){ .value = 'z' };
    try testing.expectEqual('z', boxed.get());
}

// task_id = 4
test "a box holds a slice" {
    const boxed = translator.Box([]const u8){ .value = "hello" };
    try testing.expectEqualStrings("hello", boxed.get());
}

// task_id = 4
test "the same type parameter gives the same type" {
    try testing.expectEqual(translator.Box(u32), translator.Box(u32));
}
