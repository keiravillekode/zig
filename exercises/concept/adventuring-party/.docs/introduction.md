# Introduction

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
