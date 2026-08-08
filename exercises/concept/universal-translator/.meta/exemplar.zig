pub fn firstOr(comptime T: type, readings: []const T, fallback: T) T {
    if (readings.len == 0) return fallback;
    return readings[0];
}

pub fn countMatching(comptime T: type, readings: []const T, wanted: T) usize {
    var found: usize = 0;
    for (readings) |reading| {
        if (reading == wanted) found += 1;
    }
    return found;
}

pub fn largest(comptime T: type, readings: []const T) ?T {
    if (readings.len == 0) return null;

    var best = readings[0];
    for (readings[1..]) |reading| {
        if (reading > best) best = reading;
    }
    return best;
}

pub fn Box(comptime T: type) type {
    return struct {
        const Self = @This();

        value: T,

        pub fn get(self: Self) T {
            return self.value;
        }
    };
}
