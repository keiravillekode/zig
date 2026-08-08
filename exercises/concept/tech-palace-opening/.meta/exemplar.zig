const std = @import("std");
const catalog = @import("catalog.zig");

pub fn openingHour() u32 {
    return catalog.opening_hour;
}

pub fn hoursOpenEachDay() u32 {
    return catalog.closing_hour - catalog.opening_hour;
}

pub fn bundleCost(televisions: u32, speakers: u32) u32 {
    return catalog.bundlePrice(televisions, speakers);
}

pub fn cappedDiscount(percent: u32) u32 {
    return std.math.clamp(percent, 0, catalog.max_discount_percent);
}
