const std = @import("std");
const testing = std.testing;

const orchard = @import("orchard_rounds.zig");

// task_id = 1
test "a single row holds one tree" {
    try testing.expectEqual(1, orchard.treesInOrchard(1));
}

// task_id = 1
test "four rows hold ten trees" {
    try testing.expectEqual(10, orchard.treesInOrchard(4));
}

// task_id = 1
test "an empty orchard holds none" {
    try testing.expectEqual(0, orchard.treesInOrchard(0));
}

// task_id = 1
test "a large orchard" {
    try testing.expectEqual(5050, orchard.treesInOrchard(100));
}

// task_id = 2
test "a round that covers everything" {
    try testing.expectEqual(1, orchard.roundsNeeded(4, 4));
}

// task_id = 2
test "a part-full round still counts" {
    try testing.expectEqual(3, orchard.roundsNeeded(10, 4));
}

// task_id = 2
test "no trees needs no rounds" {
    try testing.expectEqual(0, orchard.roundsNeeded(0, 4));
}

// task_id = 3
test "the first two rows are both worked" {
    try testing.expectEqual(2, orchard.rowsWorked(2));
}

// task_id = 3
test "the third row is left wild" {
    try testing.expectEqual(2, orchard.rowsWorked(3));
}

// task_id = 3
test "seven rows leave two wild" {
    try testing.expectEqual(5, orchard.rowsWorked(7));
}

// task_id = 3
test "no rows are worked in an empty orchard" {
    try testing.expectEqual(0, orchard.rowsWorked(0));
}

// task_id = 4
test "the first row alone can fill a tiny basket" {
    try testing.expectEqual(1, orchard.rowsUntilBasketFull(1));
}

// task_id = 4
test "three rows fill a basket of six" {
    try testing.expectEqual(3, orchard.rowsUntilBasketFull(6));
}

// task_id = 4
test "a basket filled part way along a row still counts that row" {
    try testing.expectEqual(3, orchard.rowsUntilBasketFull(5));
}

// task_id = 4
test "a basket too big for the orchard takes every row" {
    try testing.expectEqual(100, orchard.rowsUntilBasketFull(100000));
}
