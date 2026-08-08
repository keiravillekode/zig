# Introduction

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
