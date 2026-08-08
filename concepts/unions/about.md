# About

A union holds one of several values at a time, in the same piece of memory. A *tagged* union also remembers which one, by carrying an enum alongside it:

```zig
const Member = union(enum) {
    wizard: u32,
    warrior: u32,
    mascot,
};
```

`union(enum)` asks the compiler to generate that enum, with one value per field. A case with no type after it, like `mascot`, carries no data at all.

Building one names the active field:

```zig
const gandalf = Member{ .wizard = 40 };
const pip = Member{ .mascot = {} };
```

Reading one goes through `switch`, and the capture gives you the payload rather than the tag:

```zig
switch (member) {
    .wizard => |power| power,
    .warrior => |attack| attack / 2,
    .mascot => 0,
}
```

This is the point of a tagged union. You cannot read the `wizard` field of a value that is currently a `warrior`, because the only way in is a switch that has already established which one it is. The compiler checks that every case is covered, exactly as for an enum.

`@tagName` works on the tag, and a union can be compared against a tag with `==`:

```zig
if (member == .mascot) { ... }
```

## Size and layout

A union is as big as its largest field, plus the tag. That is the whole appeal: a value that could be any of several shapes costs the worst of them, not the sum. Compare that with a struct holding one field per possibility and a flag saying which is valid — the union is the same idea with the compiler enforcing the flag.

## Bare unions

`union { ... }` without `(enum)` has no tag. Reading a field that is not the active one is undefined behaviour, caught in safe builds and not in `ReleaseFast`. They exist for interoperating with C and for hand-rolled memory tricks; in ordinary Zig, reach for the tagged kind every time.

## Naming the tag type

The generated enum is reachable with `@typeInfo`, but it is often cleaner to declare it yourself and attach it:

```zig
const MemberKind = enum { wizard, warrior, mascot };

const Member = union(MemberKind) {
    wizard: u32,
    warrior: u32,
    mascot,
};
```

Now `MemberKind` can be used on its own — stored in a list, returned from a function — without dragging a payload along.

## Modifying the payload

Capturing with `|value|` gives a copy. Capture a pointer to change the payload in place:

```zig
switch (member) {
    .wizard => |*power| power.* += 10,
    else => {},
}
```

The union itself has to be a `var`, and the switch has to be on a pointer or on a `var` value.

## Unions can have methods

Like structs and enums, a union body takes declarations, so behaviour can live with the data:

```zig
const Member = union(enum) {
    wizard: u32,
    mascot,

    pub fn damage(self: @This()) u32 {
        return switch (self) {
            .wizard => |power| power,
            .mascot => 0,
        };
    }
};
```

## This is Zig's sum type

Where another language would reach for subclasses and a virtual method, or for a sealed interface, Zig reaches for a tagged union and a switch. The trade is real: adding a *case* means editing every switch, whereas adding a *behaviour* means adding one method. Choose the union when the set of cases is stable and the set of operations is not.
