const std = @import("std");
const testing = std.testing;

const robot = @import("bomb_squad.zig");

// task_id = 1
test "the blue wire is safe to cut" {
    try robot.cutWire('b');
}

// task_id = 1
test "the red wire is not" {
    try testing.expectError(error.WrongWire, robot.cutWire('r'));
}

// task_id = 1
test "nor is any other wire" {
    try testing.expectError(error.WrongWire, robot.cutWire('y'));
}

// task_id = 2
test "plenty of time left" {
    try testing.expectEqual(15, try robot.secondsLeft(45));
}

// task_id = 2
test "no time has passed" {
    try testing.expectEqual(60, try robot.secondsLeft(0));
}

// task_id = 2
test "the fuse has just run out" {
    try testing.expectError(error.OutOfTime, robot.secondsLeft(60));
}

// task_id = 2
test "the fuse ran out a while ago" {
    try testing.expectError(error.OutOfTime, robot.secondsLeft(90));
}

// task_id = 3
test "a successful defusal reports the time left" {
    try testing.expectEqual(15, try robot.defuse('b', 45));
}

// task_id = 3
test "the wrong wire propagates" {
    try testing.expectError(error.WrongWire, robot.defuse('r', 45));
}

// task_id = 3
test "running out of time propagates" {
    try testing.expectError(error.OutOfTime, robot.defuse('b', 90));
}

// task_id = 3
test "the timer is checked before the wire is cut" {
    try testing.expectError(error.OutOfTime, robot.defuse('r', 90));
}

// task_id = 4
test "the display shows the time left after a success" {
    try testing.expectEqual(15, robot.secondsOnDisplay('b', 45));
}

// task_id = 4
test "the display shows zero after cutting the wrong wire" {
    try testing.expectEqual(0, robot.secondsOnDisplay('r', 45));
}

// task_id = 4
test "the display shows zero after running out of time" {
    try testing.expectEqual(0, robot.secondsOnDisplay('b', 90));
}
