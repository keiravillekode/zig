pub fn canEnter(has_ticket: bool, is_member: bool) bool {
    _ = has_ticket;
    _ = is_member;
    return false;
}

pub fn mustPayDeposit(has_ticket: bool, is_member: bool) bool {
    _ = has_ticket;
    _ = is_member;
    return false;
}

pub fn isBarred(caused_trouble: bool, appeal_upheld: bool) bool {
    _ = caused_trouble;
    _ = appeal_upheld;
    return false;
}

pub fn getsFreeGo(is_member: bool, is_birthday: bool, caused_trouble: bool, appeal_upheld: bool) bool {
    _ = is_member;
    _ = is_birthday;
    _ = caused_trouble;
    _ = appeal_upheld;
    return false;
}
