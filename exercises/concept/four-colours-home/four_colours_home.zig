pub const Colour = enum { green, red, blue, yellow };

pub fn startSquare(colour: Colour) u8 {
    _ = colour;
    return 0;
}

pub fn nextPlayer(colour: Colour) Colour {
    return colour;
}

pub fn colourName(colour: Colour) []const u8 {
    _ = colour;
    return "";
}

pub fn arePartners(first: Colour, second: Colour) bool {
    _ = first;
    _ = second;
    return false;
}
