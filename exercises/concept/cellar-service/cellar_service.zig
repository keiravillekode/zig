pub const Log = struct {
    entries: [32]u8 = undefined,
    len: usize = 0,

    pub fn add(self: *Log, entry: u8) void {
        self.entries[self.len] = entry;
        self.len += 1;
    }

    pub fn text(self: *const Log) []const u8 {
        return self.entries[0..self.len];
    }
};

pub fn pourGlass(log: *Log) void {
    _ = log;
}

pub fn openBottle(log: *Log) void {
    _ = log;
}

pub fn serveRound(log: *Log, glasses: u32) void {
    _ = log;
    _ = glasses;
}

pub fn sendBottle(log: *Log, sound: bool) !void {
    _ = log;
    _ = sound;
}
