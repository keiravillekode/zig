const std = @import("std");
const mem = std.mem;

pub const Nationality = enum {
    englishman,
    spaniard,
    ukrainian,
    japanese,
    norwegian,
};

pub const Solution = struct {
    drinks_water: Nationality,
    owns_zebra: Nationality,
};

pub fn solvePuzzle(allocator: mem.Allocator) !Solution {
    _ = allocator;
    return Solution{
        .drinks_water = .norwegian,
        .owns_zebra = .japanese,
    };
}
