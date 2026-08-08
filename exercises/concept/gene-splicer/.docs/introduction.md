# Introduction

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
