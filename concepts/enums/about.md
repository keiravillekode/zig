# About

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

## Do not write `else`

An `else` branch in a switch over an enum throws away the whole benefit: a new value slips silently into it instead of causing a compile error. Write out every case, even when several share a body:

```zig
switch (turn) {
    .green, .yellow => partnerMove(),
    .red, .blue => opponentMove(),
}
```

If you genuinely mean "everything I have not listed", `else` is correct. Just make sure you mean it.

## Enums can have methods

An enum body takes declarations, so it can carry its own behaviour:

```zig
const Colour = enum {
    green, red, blue, yellow,

    pub fn startSquare(self: Colour) u8 {
        return switch (self) {
            .green => 0,
            .red => 13,
            .blue => 26,
            .yellow => 39,
        };
    }
};
```

`colour.startSquare()` then works like any other method.

## Going to and from integers

`@intFromEnum` is always safe. `@enumFromInt` is not — it panics if there is no value with that number — so it belongs at the edge of a program, where a number arrives from a file or a network.

The tag type is `u0` upwards by default, sized to fit. Naming it, as `enum(u8)`, matters when the values have to match a format outside the program.

## Non-exhaustive enums

`enum(u8) { a, b, _ }` — with a trailing underscore — says that other values are possible. Switching on one requires an `else`, and it is how you model a protocol field where unknown values must survive a round trip.

## `std.meta.stringToEnum`

Going the other way from `@tagName`:

```zig
const colour = std.meta.stringToEnum(Colour, "red"); // ?Colour
```

It returns an [optional][optionals], because the string might not name a value.

## Enums versus unions

An enum value carries nothing but which one it is. When each case needs its own data, you want a [tagged union][unions] — which is built out of an enum, and is the next concept.

[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals
[unions]: https://ziglang.org/documentation/0.16.0/#union
