const std = @import("std");
const testing = std.testing;

const station = @import("weigh_station.zig");

// task 1
test "a light lorry" {
    try testing.expectEqual(60, station.totalWeight(20, 20, 20));
}

test "a total that would overflow a single byte" {
    try testing.expectEqual(600, station.totalWeight(200, 200, 200));
}

test "the heaviest possible lorry" {
    try testing.expectEqual(765, station.totalWeight(255, 255, 255));
}

// task 2
test "a total that fits the display" {
    try testing.expectEqual(600, station.displayWeight(600));
}

test "the largest total the display can show" {
    try testing.expectEqual(65535, station.displayWeight(65535));
}

// task 3
test "the low byte of a small total is the total" {
    try testing.expectEqual(60, station.checksumByte(60));
}

test "the low byte of a larger total" {
    try testing.expectEqual(88, station.checksumByte(600));
}

test "a total that is an exact multiple of 256" {
    try testing.expectEqual(0, station.checksumByte(512));
}

// task 4
test "a total above the limit is overloaded" {
    try testing.expectEqual(true, station.isOverloaded(600, 500));
}

test "a total below the limit is fine" {
    try testing.expectEqual(false, station.isOverloaded(400, 500));
}

test "a total exactly on the limit is fine" {
    try testing.expectEqual(false, station.isOverloaded(500, 500));
}
