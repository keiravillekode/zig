const std = @import("std");
const testing = std.testing;

const console = @import("handheld_console.zig");

// task_id = 1
test "the palette starts at zero" {
    try testing.expectEqual(0, console.palette()[0]);
}

// task_id = 1
test "an entry part way along the palette" {
    try testing.expectEqual(34, console.palette()[2]);
}

// task_id = 1
test "the last entry of the palette" {
    try testing.expectEqual(255, console.palette()[15]);
}

// task_id = 1
test "the palette holds sixteen colours" {
    try testing.expectEqual(16, console.palette().len);
}

// task_id = 2
test "a run of three tiles" {
    try testing.expectEqualSlices(u8, "xxx", &console.tiles(3, 'x'));
}

// task_id = 2
test "a run of one tile" {
    try testing.expectEqualSlices(u8, "x", &console.tiles(1, 'x'));
}

// task_id = 2
test "a run of no tiles" {
    try testing.expectEqual(0, console.tiles(0, 'x').len);
}

// task_id = 2
test "the count decides the array's type" {
    try testing.expectEqual([5]u8, @TypeOf(console.tiles(5, 'x')));
}

// task_id = 3
test "zero needs no bits" {
    try testing.expectEqual(0, console.bitsNeeded(0));
}

// task_id = 3
test "one needs a single bit" {
    try testing.expectEqual(1, console.bitsNeeded(1));
}

// task_id = 3
test "a full byte needs eight bits" {
    try testing.expectEqual(8, console.bitsNeeded(255));
}

// task_id = 3
test "one more than a full byte needs nine" {
    try testing.expectEqual(9, console.bitsNeeded(256));
}

// task_id = 4
test "the palette checksum" {
    try testing.expectEqual(248, console.paletteChecksum());
}

// task_id = 4
test "the checksum is a compile-time constant" {
    try testing.expectEqual(248, comptime console.paletteChecksum());
}
