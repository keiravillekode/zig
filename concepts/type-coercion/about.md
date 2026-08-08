# About

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

## What coerces on its own

The rule is always "no information can be lost". That covers:

- an integer to a wider one of the same signedness, and any integer to a wider signed one
- a float to a wider float
- `comptime_int` and `comptime_float` to any type that can hold the actual value
- an array to a slice of the same element type
- a mutable pointer or slice to a `const` one, since promising less is safe
- any type `T` to the optional `?T`, and to the error union `!T`

Making something *more* restricted is always allowed. Making it less restricted never is: a `[]const u8` will not coerce to a `[]u8`.

## The main explicit conversions

| Builtin | Converts | Notes |
| --- | --- | --- |
| `@as(T, x)` | anything | only allows conversions that were already legal |
| `@intCast(x)` | integer to integer | panics if the value does not fit |
| `@truncate(x)` | integer to a narrower integer | keeps the low bits, never fails |
| `@floatFromInt(x)` | integer to float | |
| `@intFromFloat(x)` | float to integer | truncates towards zero, panics if out of range |
| `@enumFromInt(x)` | integer to enum | panics if there is no such tag |
| `@intFromEnum(x)` | enum to its tag type | always safe |
| `@bitCast(x)` | any type to another of the same bit width | reinterprets the bits |
| `@ptrCast(x)` | pointer to pointer | |

## Result location semantics

`@intCast(total)` does not say what it is converting *to*. The compiler works that out from where the result is being put — a variable's declared type, a function's return type, a struct field. This is called result location semantics, and it is why these builtins take one argument.

When there is no context to infer from, say so with `@as`:

```zig
const halved = @as(u16, @intCast(total)) / 2;
```

## Peer type resolution

When several values have to end up as one type — the branches of an `if`, the elements of an array literal, the arguments to `@min` — Zig finds a type they all coerce to. That is why this works:

```zig
const value = if (flag) @as(u8, 1) else @as(u16, 300); // u16
```

and why an `if` whose branches have nothing in common is rejected.

## `@intCast` versus `@truncate`

They narrow the same way; they differ in what they do about the bits that will not fit. `@intCast` treats losing them as a bug and checks at run time in safe builds. `@truncate` treats losing them as the intention and never checks. Choosing between them is a statement about your data, so choose deliberately.
