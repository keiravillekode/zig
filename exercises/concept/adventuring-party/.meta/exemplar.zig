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
    return switch (member) {
        .wizard => |power| power,
        .warrior => |fighter| fighter.attack,
        .healer, .mascot => 0,
    };
}

pub fn armour(member: Member) u32 {
    return switch (member) {
        .warrior => |fighter| fighter.armour,
        .wizard, .healer, .mascot => 0,
    };
}

pub fn kindName(member: Member) []const u8 {
    return @tagName(member);
}

pub fn partyDamage(party: []const Member) u32 {
    var total: u32 = 0;
    for (party) |member| {
        total += damage(member);
    }
    return total;
}
