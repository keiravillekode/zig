pub fn interest(balance: f64, rate: f64) f64 {
    return balance * rate / 100.0;
}

pub fn balanceAfterOneYear(balance: f64, rate: f64) f64 {
    return balance + interest(balance, rate);
}

pub fn wholePounds(balance: f64) u32 {
    return @intFromFloat(balance);
}

pub fn averageDeposit(total_pence: u32, deposits: u32) f64 {
    return @as(f64, @floatFromInt(total_pence)) / @as(f64, @floatFromInt(deposits));
}
