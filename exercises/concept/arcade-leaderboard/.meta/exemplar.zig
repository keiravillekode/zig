pub const Leaderboard = struct {
    const Self = @This();

    top_player: []const u8 = "nobody",
    top_score: u32 = 0,
    plays: u32 = 0,

    pub fn init() Self {
        return .{};
    }

    pub fn beats(self: Self, score: u32) bool {
        return score > self.top_score;
    }

    pub fn record(self: *Self, player: []const u8, score: u32) void {
        self.plays += 1;
        if (self.beats(score)) {
            self.top_player = player;
            self.top_score = score;
        }
    }

    pub fn reset(self: *Self) void {
        self.* = init();
    }
};
