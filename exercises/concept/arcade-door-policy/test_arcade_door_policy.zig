const std = @import("std");
const testing = std.testing;

const door = @import("arcade_door_policy.zig");

// task 1
test "a ticket holder may come in" {
    try testing.expect(door.canEnter(true, false));
}

test "a member may come in without a ticket" {
    try testing.expect(door.canEnter(false, true));
}

test "no ticket and no membership means no entry" {
    try testing.expect(!door.canEnter(false, false));
}

// task 2
test "a non-member with a ticket pays a deposit" {
    try testing.expect(door.mustPayDeposit(true, false));
}

test "a member with a ticket pays no deposit" {
    try testing.expect(!door.mustPayDeposit(true, true));
}

test "someone without a ticket pays no deposit" {
    try testing.expect(!door.mustPayDeposit(false, false));
}

// task 3
test "trouble without a successful appeal bars you" {
    try testing.expect(door.isBarred(true, false));
}

test "an upheld appeal lifts the bar" {
    try testing.expect(!door.isBarred(true, true));
}

test "causing no trouble means no bar" {
    try testing.expect(!door.isBarred(false, false));
}

// task 4
test "a member gets a free go on their birthday" {
    try testing.expect(door.getsFreeGo(true, true, false, false));
}

test "a barred member gets no free go" {
    try testing.expect(!door.getsFreeGo(true, true, true, false));
}

test "a member whose appeal was upheld still gets a free go" {
    try testing.expect(door.getsFreeGo(true, true, true, true));
}

test "no free go when it is not your birthday" {
    try testing.expect(!door.getsFreeGo(true, false, false, false));
}

test "no free go for non-members" {
    try testing.expect(!door.getsFreeGo(false, true, false, false));
}
