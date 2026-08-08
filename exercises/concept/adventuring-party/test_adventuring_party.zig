const std = @import("std");
const testing = std.testing;

const party = @import("adventuring_party.zig");
const Member = party.Member;

const merlin = Member{ .wizard = 40 };
const boudica = Member{ .warrior = .{ .attack = 12, .armour = 8 } };
const florence = Member{ .healer = 5 };
const scruffy = Member.mascot;

// task_id = 1
test "a wizard does damage equal to their spell power" {
    try testing.expectEqual(40, party.damage(merlin));
}

// task_id = 1
test "a warrior does damage equal to their attack" {
    try testing.expectEqual(12, party.damage(boudica));
}

// task_id = 1
test "a healer does no damage" {
    try testing.expectEqual(0, party.damage(florence));
}

// task_id = 1
test "a mascot does no damage" {
    try testing.expectEqual(0, party.damage(scruffy));
}

// task_id = 2
test "a warrior wears armour" {
    try testing.expectEqual(8, party.armour(boudica));
}

// task_id = 2
test "a wizard wears none" {
    try testing.expectEqual(0, party.armour(merlin));
}

// task_id = 2
test "a healer wears none" {
    try testing.expectEqual(0, party.armour(florence));
}

// task_id = 2
test "a mascot wears none" {
    try testing.expectEqual(0, party.armour(scruffy));
}

// task_id = 3
test "naming a wizard" {
    try testing.expectEqualStrings("wizard", party.kindName(merlin));
}

// task_id = 3
test "naming a warrior" {
    try testing.expectEqualStrings("warrior", party.kindName(boudica));
}

// task_id = 3
test "naming a mascot" {
    try testing.expectEqualStrings("mascot", party.kindName(scruffy));
}

// task_id = 4
test "a whole party" {
    try testing.expectEqual(52, party.partyDamage(&[_]Member{ merlin, boudica, florence, scruffy }));
}

// task_id = 4
test "a party of one" {
    try testing.expectEqual(40, party.partyDamage(&[_]Member{merlin}));
}

// task_id = 4
test "a party that does no damage at all" {
    try testing.expectEqual(0, party.partyDamage(&[_]Member{ florence, scruffy }));
}

// task_id = 4
test "an empty party" {
    try testing.expectEqual(0, party.partyDamage(&[_]Member{}));
}
