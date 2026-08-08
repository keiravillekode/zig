pub fn exchange(budget: u32, note_price: u32) u32 {
    return budget / note_price;
}

pub fn leftover(budget: u32, note_price: u32) u32 {
    return budget % note_price;
}

pub fn topUpFloat(float: u8, amount: u8) u8 {
    return float +| amount;
}

pub fn advanceCounter(count: u8, step: u8) u8 {
    return count +% step;
}
