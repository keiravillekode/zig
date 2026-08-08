const std = @import("std");
const testing = std.testing;

const camera = @import("speed_trap.zig");

// task 1
test "a recorded vehicle keeps its plate" {
    try testing.expectEqualStrings("AB12 CDE", camera.record("AB12 CDE", 48).plate);
}

test "a recorded vehicle keeps its speed" {
    try testing.expectEqual(48, camera.record("AB12 CDE", 48).speed_kph);
}

test "a newly recorded vehicle has no warnings" {
    try testing.expectEqual(0, camera.record("AB12 CDE", 48).warnings);
}

// task 2
test "a vehicle above the limit is speeding" {
    try testing.expect(camera.isSpeeding(camera.record("AB12 CDE", 48), 30));
}

test "a vehicle below the limit is not" {
    try testing.expect(!camera.isSpeeding(camera.record("AB12 CDE", 28), 30));
}

test "a vehicle exactly on the limit is not" {
    try testing.expect(!camera.isSpeeding(camera.record("AB12 CDE", 30), 30));
}

// task 3
test "a warning is added" {
    try testing.expectEqual(1, camera.warn(camera.record("AB12 CDE", 48)).warnings);
}

test "warnings accumulate" {
    try testing.expectEqual(3, camera.warn(camera.warn(camera.warn(camera.record("AB12 CDE", 48)))).warnings);
}

test "warning leaves the other fields alone" {
    const warned = camera.warn(camera.record("AB12 CDE", 48));
    try testing.expectEqualStrings("AB12 CDE", warned.plate);
    try testing.expectEqual(48, warned.speed_kph);
}

test "the original vehicle is not changed" {
    const original = camera.record("AB12 CDE", 48);
    _ = camera.warn(original);
    try testing.expectEqual(0, original.warnings);
}

// task 4
test "a fine for speeding" {
    try testing.expectEqual(180, camera.fineInPounds(camera.record("AB12 CDE", 48), 30));
}

test "no fine below the limit" {
    try testing.expectEqual(0, camera.fineInPounds(camera.record("AB12 CDE", 28), 30));
}

test "no fine exactly on the limit" {
    try testing.expectEqual(0, camera.fineInPounds(camera.record("AB12 CDE", 30), 30));
}

test "one kilometre per hour over costs ten pounds" {
    try testing.expectEqual(10, camera.fineInPounds(camera.record("AB12 CDE", 31), 30));
}
