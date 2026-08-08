# Introduction

An enum is a type with a fixed set of named values:

```zig
const Colour = enum { green, red, blue, yellow };
```

A value is written with the type and the name:

```zig
const first = Colour.green;
```

Where the type is already known, the name alone is enough, with a leading dot:

```zig
var turn: Colour = .green;
turn = .red;
```

Switching on an enum is where they earn their keep, because the compiler checks that every value is handled:

```zig
switch (turn) {
    .green => 0,
    .red => 13,
    .blue => 26,
    .yellow => 39,
}
```

No `else` is needed, and leaving one of the four out is a compile error. Add a fifth colour later and every switch that has not been updated stops compiling — the compiler hands you the list of places to fix.

`@tagName` gives a value's name as a string:

```zig
@tagName(Colour.red) // "red"
```

Each value also has a number, counting from zero unless you say otherwise. `@intFromEnum` reads it, and an explicit numbering is written like a field type:

```zig
const Colour = enum(u8) { green = 1, red = 2, blue = 4, yellow = 8 };
```
