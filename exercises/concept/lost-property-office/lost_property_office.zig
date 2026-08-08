pub fn ownerOrUnknown(owner: ?u32) u32 {
    _ = owner;
    return 0;
}

pub fn isClaimed(owner: ?u32) bool {
    _ = owner;
    return false;
}

pub fn find(codes: []const u32, wanted: u32) ?usize {
    _ = codes;
    _ = wanted;
    return null;
}

pub fn feeFor(days: ?u32) u32 {
    _ = days;
    return 0;
}
