pub const DefusalError = error{
    WrongWire,
    OutOfTime,
};

pub fn cutWire(colour: u8) DefusalError!void {
    _ = colour;
}

pub fn secondsLeft(elapsed: u32) DefusalError!u32 {
    _ = elapsed;
    return 0;
}

pub fn defuse(colour: u8, elapsed: u32) DefusalError!u32 {
    _ = colour;
    _ = elapsed;
    return 0;
}

pub fn secondsOnDisplay(colour: u8, elapsed: u32) u32 {
    _ = colour;
    _ = elapsed;
    return 0;
}
