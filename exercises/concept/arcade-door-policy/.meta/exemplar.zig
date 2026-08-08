pub fn canEnter(has_ticket: bool, is_member: bool) bool {
    return has_ticket or is_member;
}

pub fn mustPayDeposit(has_ticket: bool, is_member: bool) bool {
    return has_ticket and !is_member;
}

pub fn isBarred(caused_trouble: bool, appeal_upheld: bool) bool {
    return caused_trouble and !appeal_upheld;
}

pub fn getsFreeGo(is_member: bool, is_birthday: bool, caused_trouble: bool, appeal_upheld: bool) bool {
    return is_member and is_birthday and !isBarred(caused_trouble, appeal_upheld);
}
