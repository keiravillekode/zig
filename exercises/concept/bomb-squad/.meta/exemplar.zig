const fuse_seconds = 60;
const safe_wire = 'b';

pub const DefusalError = error{
    WrongWire,
    OutOfTime,
};

pub fn cutWire(colour: u8) DefusalError!void {
    if (colour != safe_wire) return error.WrongWire;
}

pub fn secondsLeft(elapsed: u32) DefusalError!u32 {
    if (elapsed >= fuse_seconds) return error.OutOfTime;
    return fuse_seconds - elapsed;
}

pub fn defuse(colour: u8, elapsed: u32) DefusalError!u32 {
    const remaining = try secondsLeft(elapsed);
    try cutWire(colour);
    return remaining;
}

pub fn secondsOnDisplay(colour: u8, elapsed: u32) u32 {
    return defuse(colour, elapsed) catch 0;
}
