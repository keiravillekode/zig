pub fn firstOr(comptime T: type, readings: []const T, fallback: T) T {
    _ = readings;
    return fallback;
}

pub fn countMatching(comptime T: type, readings: []const T, wanted: T) usize {
    _ = readings;
    _ = wanted;
    return 0;
}

pub fn largest(comptime T: type, readings: []const T) ?T {
    _ = readings;
    return null;
}

pub fn Box(comptime T: type) type {
    return struct {
        const Self = @This();

        value: T,

        pub fn get(self: Self) T {
            _ = self;
            return undefined;
        }
    };
}
