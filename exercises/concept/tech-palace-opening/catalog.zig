//! The Tech Palace catalog. This file is part of the exercise and is read-only.

pub const opening_hour: u32 = 9;
pub const closing_hour: u32 = 21;

pub const max_discount_percent: u32 = 50;

const television_price: u32 = 899;
const speaker_price: u32 = 129;

pub fn bundlePrice(televisions: u32, speakers: u32) u32 {
    return televisions * television_price + speakers * speaker_price;
}
