# About

A Zig program is a list of declarations. `const` gives a value a name that can never change, and `var` gives it a name that can:

```zig
const answer = 42;

var counter: u8 = 0;
counter = counter + 1;
```

Zig is statically typed, so every value has a type that is fixed when the program is compiled. Usually the compiler works the type out from the value itself, but it can also be written after a colon, as `counter` does above.

Functions are declared with `fn`. Every parameter states its type, and the return type is written after the parameter list:

```zig
fn double(n: u8) u8 {
    return n * 2;
}
```

Arithmetic uses `+`, `-`, `*`, `/` and `%`, with the usual precedence: `2 + 3 * 4` is `14`. Division between integers throws away any remainder, so `7 / 2` is `3`.

A declaration is only visible inside its own file unless it is marked `pub`, short for public:

```zig
pub fn triple(n: u8) u8 {
    return n * 3;
}
```

Comments start with `//` and run to the end of the line. Zig has no block comment.

## Prefer `const`

Zig pushes hard towards `const`. Declaring something `var` and never assigning to it again is a compile error, not a style suggestion:

```zig
var total = 10; // error: local variable is never mutated
```

The same strictness applies to anything declared and never used. This catches typos and leftovers, but it is inconvenient while a function is half-written, so Zig provides a discard:

```zig
fn ignoreForNow(value: u8) u8 {
    _ = value;
    return 0;
}
```

Assigning to `_` says "I know this exists and I am deliberately not using it".

## Function parameters are constant

Parameters cannot be assigned to at all — there is no `var` parameter. If a function needs to change its input, it copies it first:

```zig
fn countdown(start: u8) u8 {
    var remaining = start;
    while (remaining > 0) remaining -= 1;
    return remaining;
}
```

## Naming conventions

Zig's standard library follows conventions that the community sticks to closely:

- Functions are `camelCase`.
- Variables and constants are `snake_case`.
- Types are `TitleCase`, and so are functions that return a type.

## Literals have their own types

A plain number written in source code is not yet a `u8` or an `i32`. It has the type `comptime_int`, an integer known at compile time with no size limit at all. It becomes a sized integer only when it is assigned somewhere that has a type:

```zig
const big = 1000000000000000000000; // fine, comptime_int
const small: u8 = 200;              // becomes a u8
```

This is why arithmetic on literals never overflows, while the same arithmetic on [sized integers][integers] might.

## Shadowing is not allowed

Many languages let an inner scope reuse a name from an outer one. Zig does not:

```zig
const value = 1;

fn shadow() u8 {
    const value = 2; // error: local shadows declaration of 'value'
    return value;
}
```

The only way to reuse a name is to pick a different one, which keeps the meaning of an identifier the same everywhere it appears in a file.

[integers]: https://ziglang.org/documentation/0.16.0/#Integers
