const std = @import("std");
const testing = std.testing;

const gang = @import("chain_gang.zig");
const Link = gang.Link;

// task 1
test "the tally goes up by one" {
    var tally: u32 = 3;
    gang.addOne(&tally);
    try testing.expectEqual(4, tally);
}

test "adding to an empty tally" {
    var tally: u32 = 0;
    gang.addOne(&tally);
    try testing.expectEqual(1, tally);
}

test "adding twice" {
    var tally: u32 = 0;
    gang.addOne(&tally);
    gang.addOne(&tally);
    try testing.expectEqual(2, tally);
}

// task 2
test "two workers change places" {
    var first: u32 = 1;
    var second: u32 = 2;
    gang.swap(&first, &second);
    try testing.expectEqual(2, first);
    try testing.expectEqual(1, second);
}

test "swapping equal numbers changes nothing" {
    var first: u32 = 7;
    var second: u32 = 7;
    gang.swap(&first, &second);
    try testing.expectEqual(7, first);
    try testing.expectEqual(7, second);
}

// task 3
test "a worker is renumbered" {
    var worker = Link{ .id = 1 };
    gang.renumber(&worker, 7);
    try testing.expectEqual(7, worker.id);
}

test "renumbering leaves the rest of the chain alone" {
    const tail = Link{ .id = 2 };
    var worker = Link{ .id = 1, .next = &tail };
    gang.renumber(&worker, 7);
    try testing.expectEqual(2, worker.next.?.id);
}

// task 4
test "an empty chain" {
    try testing.expectEqual(0, gang.chainLength(null));
}

test "a chain of one" {
    const only = Link{ .id = 1 };
    try testing.expectEqual(1, gang.chainLength(&only));
}

test "a chain of three" {
    const third = Link{ .id = 3 };
    const second = Link{ .id = 2, .next = &third };
    const first = Link{ .id = 1, .next = &second };
    try testing.expectEqual(3, gang.chainLength(&first));
}
