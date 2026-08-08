# About

`switch` matches one value against a list of cases:

```zig
switch (base) {
    'A' => 'T',
    'T' => 'A',
    'C' => 'G',
    'G' => 'C',
    else => base,
}
```

Each case is `pattern => result`, separated by commas. Like `if`, a `switch` is an expression, so it produces a value directly.

Several values can share a case, and a range is written with three dots:

```zig
switch (score) {
    0, 1, 2 => "low",
    3...7 => "middling",
    else => "high",
}
```

A `switch` must handle every value the type can take. For an integer that means an `else` branch, because there are far too many values to list. Leaving a gap is a compile error, not a silent fall-through.

A case that needs more than one expression uses a block:

```zig
switch (base) {
    'A' => {
        recordPurine();
        return 'T';
    },
    else => return base,
}
```

There is no fall-through between cases, so no `break` is needed to stop one case running into the next.

## Exhaustiveness is the point

The compiler checks that every possible value is covered. With an [enum][enums] this becomes a genuinely useful safety net: add a value to the enum and every `switch` that does not handle it stops compiling, so the compiler lists the places you have to think about.

That only works if you have not written `else`. An `else` branch silently absorbs anything new, so on an enum it is worth leaving out unless you really do mean "everything else".

## Capturing the value

`else => |other|` and `pattern => |value|` bind what was matched, which matters when the cases are ranges:

```zig
switch (score) {
    0...9 => |low| low * 2,
    else => |high| high,
}
```

For a [tagged union][unions] the capture is the payload rather than the tag, which is how a union is taken apart.

## Producing a value from a block

A case whose body is a block yields a value with a labelled `break`:

```zig
const bonus = switch (grade) {
    'A' => blk: {
        const base = 100;
        break :blk base * multiplier;
    },
    else => 0,
};
```

## `inline else`

`inline else` unrolls the branch at compile time, generating a separate copy for every remaining value. It is what lets one `switch` arm handle cases whose *types* differ, and it belongs with [comptime][comptime].

## Labelled switch

A `switch` can be labelled and continued, jumping straight to another case:

```zig
state: switch (start) {
    .running => continue :state .stopping,
    .stopping => {},
}
```

This compiles to a direct jump, and is how state machines and interpreter loops are written in Zig without a `while` around the outside.

## When to prefer `if`

`switch` shines when one value is compared against many alternatives. When the conditions test different things, or involve `and` and `or`, a chain of `else if` says it better. Neither is faster than the other for small numbers of cases.

[enums]: https://ziglang.org/documentation/0.16.0/#enum
[unions]: https://ziglang.org/documentation/0.16.0/#union
[comptime]: https://ziglang.org/documentation/0.16.0/#comptime
