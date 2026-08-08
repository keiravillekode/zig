pub fn raise(state: u8, position: u3) u8 {
    _ = position;
    return state;
}

pub fn drop(state: u8, position: u3) u8 {
    _ = position;
    return state;
}

pub fn isRaised(state: u8, position: u3) bool {
    _ = state;
    _ = position;
    return false;
}

pub fn wrongTumblers(state: u8, combination: u8) u8 {
    _ = state;
    _ = combination;
    return 0;
}
