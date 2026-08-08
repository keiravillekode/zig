# Instructions

You are writing the combat maths for a role-playing game. A party is made up of members of quite different kinds, and each kind carries different information — which is exactly what a tagged union is for.

The exercise file already declares it:

```zig
pub const Member = union(enum) {
    wizard: u32, // spell power
    warrior: Warrior,
    healer: u32, // hit points restored per turn
    mascot, // carries nothing at all
};

pub const Warrior = struct {
    attack: u32,
    armour: u32,
};
```

Do not write an `else` branch in any of these switches.

## 1. Work out a member's damage

A wizard does damage equal to their spell power. A warrior does damage equal to their attack. A healer and a mascot do none.

Define the `damage` function, which takes a member and returns the damage they do.

```zig
damage(Member{ .wizard = 40 })
// => 40
```

## 2. Work out a member's armour

Only a warrior wears armour. Everyone else has none.

Define the `armour` function, which takes a member and returns their armour.

```zig
armour(Member{ .warrior = .{ .attack = 12, .armour = 8 } })
// => 8
```

## 3. Name a member's kind

Define the `kindName` function, which takes a member and returns the name of its kind as a string.

```zig
kindName(Member{ .healer = 5 })
// => "healer"
```

## 4. Add up the party's damage

Define the `partyDamage` function, which takes a party and returns the total damage all its members do. Reuse the function from task 1.

```zig
partyDamage(&[_]Member{ Member{ .wizard = 40 }, Member.mascot })
// => 40
```
