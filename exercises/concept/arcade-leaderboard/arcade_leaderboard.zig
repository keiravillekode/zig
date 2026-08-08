pub const Leaderboard = struct {
    const Self = @This();

    top_player: []const u8 = "nobody",
    top_score: u32 = 0,
    plays: u32 = 0,

    pub fn init() Self {
        return .{};
    }

    pub fn beats(self: Self, score: u32) bool {
        _ = self;
        _ = score;
        return false;
    }

    pub fn record(self: *Self, player: []const u8, score: u32) void {
        _ = self;
        _ = player;
        _ = score;
    }

    pub fn reset(self: *Self) void {
        _ = self;
    }
};
