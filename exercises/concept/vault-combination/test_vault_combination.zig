const std = @import("std");
const testing = std.testing;

const vault = @import("vault_combination.zig");

// task 1
test "raising a tumbler on an open lock" {
    try testing.expectEqual(0b0000_0100, vault.raise(0b0000_0000, 2));
}

test "raising the first tumbler" {
    try testing.expectEqual(0b0000_0001, vault.raise(0b0000_0000, 0));
}

test "raising the last tumbler" {
    try testing.expectEqual(0b1000_0000, vault.raise(0b0000_0000, 7));
}

test "raising leaves the other tumblers alone" {
    try testing.expectEqual(0b0000_0101, vault.raise(0b0000_0001, 2));
}

test "raising a tumbler that is already up" {
    try testing.expectEqual(0b0000_0100, vault.raise(0b0000_0100, 2));
}

// task 2
test "dropping a raised tumbler" {
    try testing.expectEqual(0b0000_0001, vault.drop(0b0000_0101, 2));
}

test "dropping a tumbler that is already down" {
    try testing.expectEqual(0b0000_0001, vault.drop(0b0000_0001, 2));
}

test "dropping the last tumbler" {
    try testing.expectEqual(0b0000_0001, vault.drop(0b1000_0001, 7));
}

test "dropping everything one at a time" {
    try testing.expectEqual(0b0000_0000, vault.drop(vault.drop(0b0000_0101, 0), 2));
}

// task 3
test "a raised tumbler" {
    try testing.expect(vault.isRaised(0b0000_0100, 2));
}

test "a dropped tumbler" {
    try testing.expect(!vault.isRaised(0b0000_0001, 2));
}

test "checking the last tumbler" {
    try testing.expect(vault.isRaised(0b1000_0000, 7));
}

test "a neighbouring tumbler does not count" {
    try testing.expect(!vault.isRaised(0b0000_0010, 2));
}

// task 4
test "one tumbler wrong" {
    try testing.expectEqual(0b0000_0100, vault.wrongTumblers(0b0000_0101, 0b0000_0001));
}

test "the combination is right" {
    try testing.expectEqual(0b0000_0000, vault.wrongTumblers(0b0110_0101, 0b0110_0101));
}

test "every tumbler wrong" {
    try testing.expectEqual(0b1111_1111, vault.wrongTumblers(0b0000_0000, 0b1111_1111));
}

test "a mixture" {
    try testing.expectEqual(0b1010_0000, vault.wrongTumblers(0b1111_0000, 0b0101_0000));
}
