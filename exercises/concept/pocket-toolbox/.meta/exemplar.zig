pub fn smallest(first: i32, second: i32, third: i32) i32 {
    return @min(first, second, third);
}

pub fn gap(first: i32, second: i32) u32 {
    return @abs(first - second);
}

pub fn flagsRaised(status: u8) u8 {
    return @popCount(status);
}

pub fn wouldOverflow(first: u8, second: u8) bool {
    const sum = @addWithOverflow(first, second);
    return sum[1] != 0;
}
