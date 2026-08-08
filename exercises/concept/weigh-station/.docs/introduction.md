# Introduction

Zig converts a value from one type to another on its own only when nothing can go wrong. Widening an integer is always safe, so it happens silently:

```zig
const small: u8 = 200;
const wide: u32 = small; // fine, every u8 fits in a u32
```

Going the other way might lose information, so Zig refuses and makes you say what you want with a builtin.

`@as` states the type an expression should have. It only performs conversions that were already allowed, so it is a way of being explicit rather than a way of forcing anything:

```zig
const total = @as(u32, a) + b; // do this sum in u32, not u8
```

`@intCast` converts to a narrower integer and promises the value fits. If it does not, the program stops:

```zig
const display: u16 = @intCast(total);
```

`@truncate` also narrows, but it keeps the low bits and throws the rest away without complaint. Reach for it when discarding the top bits is the point:

```zig
const checksum: u8 = @truncate(total);
```

Most of these builtins work out the type they should produce from where the result is going, which is why the examples above name the type on the left and not inside the call.
