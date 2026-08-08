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
    log.add('p');
    defer log.add('w');
}

pub fn openBottle(log: *Log) void {
    log.add('o');
    defer log.add('l');
    defer log.add('c');
}

pub fn serveRound(log: *Log, glasses: u32) void {
    for (0..glasses) |_| {
        log.add('p');
        defer log.add('w');
    }
}

pub fn sendBottle(log: *Log, sound: bool) !void {
    log.add('s');
    errdefer log.add('r');
    if (!sound) return error.Spoiled;
    log.add('d');
}
