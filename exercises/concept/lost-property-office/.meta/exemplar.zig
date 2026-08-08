const free_days = 7;
const pence_per_day = 50;

pub fn ownerOrUnknown(owner: ?u32) u32 {
    return owner orelse 0;
}

pub fn isClaimed(owner: ?u32) bool {
    return owner != null;
}

pub fn find(codes: []const u32, wanted: u32) ?usize {
    for (codes, 0..) |code, index| {
        if (code == wanted) return index;
    }
    return null;
}

pub fn feeFor(days: ?u32) u32 {
    if (days) |stored| {
        if (stored <= free_days) return 0;
        return (stored - free_days) * pence_per_day;
    } else {
        return 0;
    }
}
