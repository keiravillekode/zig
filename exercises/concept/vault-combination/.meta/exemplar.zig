pub fn raise(state: u8, position: u3) u8 {
    const mask = @as(u8, 1) << position;
    return state | mask;
}

pub fn drop(state: u8, position: u3) u8 {
    const mask = @as(u8, 1) << position;
    return state & ~mask;
}

pub fn isRaised(state: u8, position: u3) bool {
    const mask = @as(u8, 1) << position;
    return (state & mask) != 0;
}

pub fn wrongTumblers(state: u8, combination: u8) u8 {
    return state ^ combination;
}
