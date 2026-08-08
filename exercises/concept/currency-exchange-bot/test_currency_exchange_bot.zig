const std = @import("std");
const testing = std.testing;

const bot = @import("currency_exchange_bot.zig");

// task_id = 1
test "an exact amount exchanges completely" {
    try testing.expectEqual(12, bot.exchange(120, 10));
}

// task_id = 1
test "an awkward amount is rounded down" {
    try testing.expectEqual(12, bot.exchange(127, 10));
}

// task_id = 1
test "too little money buys no notes" {
    try testing.expectEqual(0, bot.exchange(7, 10));
}

// task_id = 2
test "an exact amount leaves nothing over" {
    try testing.expectEqual(0, bot.leftover(120, 10));
}

// task_id = 2
test "an awkward amount leaves change" {
    try testing.expectEqual(7, bot.leftover(127, 10));
}

// task_id = 2
test "too little money is all left over" {
    try testing.expectEqual(7, bot.leftover(7, 10));
}

// task_id = 3
test "a top up with room to spare" {
    try testing.expectEqual(60, bot.topUpFloat(50, 10));
}

// task_id = 3
test "a top up that would overflow stops at the maximum" {
    try testing.expectEqual(255, bot.topUpFloat(250, 10));
}

// task_id = 3
test "a full float stays full" {
    try testing.expectEqual(255, bot.topUpFloat(255, 200));
}

// task_id = 4
test "the counter advances normally" {
    try testing.expectEqual(60, bot.advanceCounter(50, 10));
}

// task_id = 4
test "the counter rolls over past its maximum" {
    try testing.expectEqual(4, bot.advanceCounter(250, 10));
}

// task_id = 4
test "the counter lands exactly on zero" {
    try testing.expectEqual(0, bot.advanceCounter(255, 1));
}
