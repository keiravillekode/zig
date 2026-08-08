const std = @import("std");
const testing = std.testing;

const cutout = @import("ransom_note.zig");

// task_id = 1
test "counting repeated letters" {
    var counts = try cutout.letterCounts(testing.allocator, "abba");
    defer counts.deinit();
    try testing.expectEqual(2, counts.get('a').?);
    try testing.expectEqual(2, counts.get('b').?);
}

// task_id = 1
test "spaces are not counted" {
    var counts = try cutout.letterCounts(testing.allocator, "a b a");
    defer counts.deinit();
    try testing.expectEqual(2, counts.get('a').?);
    try testing.expectEqual(null, counts.get(' '));
}

// task_id = 1
test "an empty text has no letters" {
    var counts = try cutout.letterCounts(testing.allocator, "");
    defer counts.deinit();
    try testing.expectEqual(0, counts.count());
}

// task_id = 2
test "reading a letter that is there" {
    var counts = try cutout.letterCounts(testing.allocator, "abba");
    defer counts.deinit();
    try testing.expectEqual(2, cutout.countOf(&counts, 'a'));
}

// task_id = 2
test "reading a letter that is not there" {
    var counts = try cutout.letterCounts(testing.allocator, "abba");
    defer counts.deinit();
    try testing.expectEqual(0, cutout.countOf(&counts, 'z'));
}

// task_id = 3
test "two distinct letters" {
    try testing.expectEqual(2, try cutout.distinctLetters(testing.allocator, "abba"));
}

// task_id = 3
test "every letter distinct" {
    try testing.expectEqual(4, try cutout.distinctLetters(testing.allocator, "abcd"));
}

// task_id = 3
test "spaces do not count towards distinct letters" {
    try testing.expectEqual(2, try cutout.distinctLetters(testing.allocator, "a b a b"));
}

// task_id = 3
test "an empty text uses no letters" {
    try testing.expectEqual(0, try cutout.distinctLetters(testing.allocator, ""));
}

// task_id = 4
test "a note that can be cut" {
    try testing.expect(try cutout.canCut(testing.allocator, "ab", "abba"));
}

// task_id = 4
test "a note needing a letter the magazine lacks" {
    try testing.expect(!try cutout.canCut(testing.allocator, "az", "abba"));
}

// task_id = 4
test "a note needing more of a letter than the magazine has" {
    try testing.expect(!try cutout.canCut(testing.allocator, "aaa", "abba"));
}

// task_id = 4
test "using every letter exactly" {
    try testing.expect(try cutout.canCut(testing.allocator, "abba", "abba"));
}

// task_id = 4
test "spaces in the note are free" {
    try testing.expect(try cutout.canCut(testing.allocator, "a b", "ab"));
}

// task_id = 4
test "an empty note can always be cut" {
    try testing.expect(try cutout.canCut(testing.allocator, "", "abba"));
}

// task_id = 4
test "nothing can be cut from an empty magazine" {
    try testing.expect(!try cutout.canCut(testing.allocator, "a", ""));
}

// task_id = 4
test "cutting survives a failing allocator" {
    try testing.checkAllAllocationFailures(testing.allocator, struct {
        fn check(allocator: std.mem.Allocator) !void {
            try testing.expect(try cutout.canCut(allocator, "ab", "abba"));
        }
    }.check, .{});
}
