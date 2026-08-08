# Introduction

An error set is a type listing the things that can go wrong:

```zig
const DefusalError = error{
    WrongWire,
    OutOfTime,
};
```

A function that might fail returns an *error union*, written with `!` between the error set and the normal return type:

```zig
fn cutWire(colour: u8) DefusalError!void { ... }
```

Inside, an error is returned like any other value:

```zig
return error.WrongWire;
```

A caller cannot ignore it. `try` says "if this failed, return that same error from me; otherwise give me the value":

```zig
const seconds = try secondsLeft(elapsed);
```

`catch` handles it here instead, supplying a value to use when things went wrong:

```zig
const seconds = secondsLeft(elapsed) catch 0;
```

Leaving the error set off, as `!u32`, asks the compiler to work out which errors the function can actually produce. That is the usual style for a function whose errors all come from the things it calls.

Errors are values, not exceptions. Nothing unwinds, nothing is thrown, and every place an error can appear is marked in the source with `try` or `catch`.
