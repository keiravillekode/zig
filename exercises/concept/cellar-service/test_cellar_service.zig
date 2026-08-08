const std = @import("std");
const testing = std.testing;

const cellar = @import("cellar_service.zig");
const Log = cellar.Log;

// task 1
test "pouring a glass washes it afterwards" {
    var log = Log{};
    cellar.pourGlass(&log);
    try testing.expectEqualStrings("pw", log.text());
}

test "two glasses in a row" {
    var log = Log{};
    cellar.pourGlass(&log);
    cellar.pourGlass(&log);
    try testing.expectEqualStrings("pwpw", log.text());
}

// task 2
test "a bottle is corked before the cellar is locked" {
    var log = Log{};
    cellar.openBottle(&log);
    try testing.expectEqualStrings("ocl", log.text());
}

// task 3
test "a round of three glasses" {
    var log = Log{};
    cellar.serveRound(&log, 3);
    try testing.expectEqualStrings("pwpwpw", log.text());
}

test "a round of one glass" {
    var log = Log{};
    cellar.serveRound(&log, 1);
    try testing.expectEqualStrings("pw", log.text());
}

test "a round of no glasses" {
    var log = Log{};
    cellar.serveRound(&log, 0);
    try testing.expectEqualStrings("", log.text());
}

// task 4
test "a sound bottle is delivered" {
    var log = Log{};
    try cellar.sendBottle(&log, true);
    try testing.expectEqualStrings("sd", log.text());
}

test "a spoiled bottle comes back" {
    var log = Log{};
    try testing.expectError(error.Spoiled, cellar.sendBottle(&log, false));
    try testing.expectEqualStrings("sr", log.text());
}

test "a successful delivery does not return the bottle" {
    var log = Log{};
    try cellar.sendBottle(&log, true);
    try testing.expectEqual(2, log.len);
}
