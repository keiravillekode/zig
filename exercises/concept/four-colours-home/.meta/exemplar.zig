pub const Colour = enum { green, red, blue, yellow };

const Team = enum { one, two };

pub fn startSquare(colour: Colour) u8 {
    return switch (colour) {
        .green => 0,
        .red => 13,
        .blue => 26,
        .yellow => 39,
    };
}

pub fn nextPlayer(colour: Colour) Colour {
    return switch (colour) {
        .green => .red,
        .red => .blue,
        .blue => .yellow,
        .yellow => .green,
    };
}

pub fn colourName(colour: Colour) []const u8 {
    return @tagName(colour);
}

pub fn arePartners(first: Colour, second: Colour) bool {
    if (first == second) return false;
    return teamOf(first) == teamOf(second);
}

fn teamOf(colour: Colour) Team {
    return switch (colour) {
        .green, .yellow => .one,
        .red, .blue => .two,
    };
}
