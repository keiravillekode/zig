const std = @import("std");
const testing = std.testing;

const potions = @import("alchemists_apprentice.zig");

// task_id = 1
test "a batch simmers for 25 minutes" {
    try testing.expectEqual(25, potions.simmerTimeInMinutes());
}

// task_id = 2
test "no simmer time has passed yet" {
    try testing.expectEqual(25, potions.remainingSimmerTime(0));
}

// task_id = 2
test "some of the simmer time has passed" {
    try testing.expectEqual(15, potions.remainingSimmerTime(10));
}

// task_id = 2
test "the batch has finished simmering" {
    try testing.expectEqual(0, potions.remainingSimmerTime(25));
}

// task_id = 3
test "grinding a single ingredient" {
    try testing.expectEqual(3, potions.grindingTimeInMinutes(1));
}

// task_id = 3
test "grinding several ingredients" {
    try testing.expectEqual(12, potions.grindingTimeInMinutes(4));
}

// task_id = 3
test "grinding nothing takes no time" {
    try testing.expectEqual(0, potions.grindingTimeInMinutes(0));
}

// task_id = 4
test "a bottle with no ingredients costs the base price" {
    try testing.expectEqual(12, potions.priceInCoins(0));
}

// task_id = 4
test "each ingredient adds to the price" {
    try testing.expectEqual(24, potions.priceInCoins(3));
}
