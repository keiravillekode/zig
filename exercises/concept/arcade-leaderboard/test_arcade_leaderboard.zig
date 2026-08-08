const std = @import("std");
const testing = std.testing;

const Leaderboard = @import("arcade_leaderboard.zig").Leaderboard;

// task_id = 1
test "a new leaderboard has no top score" {
    try testing.expectEqual(0, Leaderboard.init().top_score);
}

// task_id = 1
test "a new leaderboard has nobody at the top" {
    try testing.expectEqualStrings("nobody", Leaderboard.init().top_player);
}

// task_id = 1
test "a new leaderboard has no plays" {
    try testing.expectEqual(0, Leaderboard.init().plays);
}

// task_id = 2
test "any score beats an empty leaderboard" {
    try testing.expect(Leaderboard.init().beats(120));
}

// task_id = 2
test "a higher score beats the top score" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    try testing.expect(board.beats(200));
}

// task_id = 2
test "a lower score does not" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    try testing.expect(!board.beats(90));
}

// task_id = 2
test "an equal score does not" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    try testing.expect(!board.beats(120));
}

// task_id = 3
test "recording a play counts it" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    try testing.expectEqual(1, board.plays);
}

// task_id = 3
test "a winning score takes the top spot" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    try testing.expectEqualStrings("ada", board.top_player);
    try testing.expectEqual(120, board.top_score);
}

// task_id = 3
test "a losing score is still counted as a play" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    board.record("bob", 90);
    try testing.expectEqual(2, board.plays);
    try testing.expectEqualStrings("ada", board.top_player);
    try testing.expectEqual(120, board.top_score);
}

// task_id = 3
test "the top spot changes hands" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    board.record("bob", 200);
    try testing.expectEqualStrings("bob", board.top_player);
    try testing.expectEqual(200, board.top_score);
}

// task_id = 4
test "resetting clears the plays" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    board.reset();
    try testing.expectEqual(0, board.plays);
}

// task_id = 4
test "resetting clears the top spot" {
    var board = Leaderboard.init();
    board.record("ada", 120);
    board.reset();
    try testing.expectEqualStrings("nobody", board.top_player);
    try testing.expectEqual(0, board.top_score);
}
