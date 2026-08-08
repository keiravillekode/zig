pub const Warrior = struct {
    attack: u32,
    armour: u32,
};

pub const Member = union(enum) {
    wizard: u32,
    warrior: Warrior,
    healer: u32,
    mascot,
};

pub fn damage(member: Member) u32 {
    _ = member;
    return 0;
}

pub fn armour(member: Member) u32 {
    _ = member;
    return 0;
}

pub fn kindName(member: Member) []const u8 {
    _ = member;
    return "";
}

pub fn partyDamage(party: []const Member) u32 {
    _ = party;
    return 0;
}
