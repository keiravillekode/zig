# About

Builtins are functions the compiler provides itself. They are spelled with a leading `@`, need no import, and cannot be redefined:

```zig
const closest = @min(a, b);
```

Some exist because they need to know things only the compiler knows, such as a value's type. Others exist because they map to a single machine instruction and no library function could do better.

The ones worth knowing early:

| Builtin | Does |
| --- | --- |
| `@min(a, b, ...)`, `@max(...)` | the smallest or largest of any number of arguments |
| `@abs(x)` | magnitude; the result is unsigned |
| `@popCount(x)` | how many bits of `x` are set |
| `@memset(slice, value)` | fill a slice |
| `@memcpy(dest, source)` | copy between slices of equal length |
| `@sizeOf(T)`, `@typeName(T)` | questions about a type |

There is also a family for arithmetic that might overflow. Instead of trapping, they hand back both the answer and a bit saying whether it wrapped:

```zig
const sum = @addWithOverflow(a, b);
// sum[0] is the result, sum[1] is 1 if it overflowed
```

`@subWithOverflow`, `@mulWithOverflow` and `@shlWithOverflow` follow the same shape. They are how you check for overflow rather than letting it stop the program.

You have already been using builtins: `@import`, `@as`, `@intCast` and `@tagName` are all part of the same family. The [full list][builtins] is not long, and it is worth a browse.

[builtins]: https://ziglang.org/documentation/0.16.0/#Builtin-Functions

## Why they are not ordinary functions

Three reasons, and every builtin is at least one of them:

1. **It takes a type.** `@sizeOf(u32)` needs a type as a value, at compile time.
1. **It is polymorphic in a way the language cannot express.** `@min` takes any number of arguments of any numeric type and works out the result type by peer resolution.
1. **It is a single instruction.** `@popCount`, `@clz`, `@byteSwap` — wrapping these in a library function would be all overhead.

The `@` is deliberate. It marks the places where you are talking to the compiler rather than calling code someone wrote, so nothing hides behind an innocent-looking name.

## The overflow family in full

```zig
const result = @addWithOverflow(a, b);
if (result[1] != 0) return error.Overflow;
return result[0];
```

The return is a tuple of the wrapped result and a `u1`. That is a slightly awkward shape, and `std.math.add`, `sub` and `mul` wrap it into something friendlier:

```zig
const total = try std.math.add(u8, a, b); // error.Overflow instead of a flag
```

Use the builtins when you want to inspect the flag, and `std.math` when you want an error.

## Reflection

`@typeInfo(T)` returns a tagged union describing a type — its fields, its tag type, whether it is a pointer. It is what `std.meta` is built on, and what makes generic code possible:

```zig
const info = @typeInfo(Colour);
const how_many = info.@"enum".fields.len;
```

`@field(value, "name")` and `@hasDecl(T, "name")` reach into a type by a string known at compile time.

## `@memset` and `@memcpy`

`@memcpy` requires the destination and source to be the same length, and requires that they do not overlap. When they might overlap, use `std.mem.copyForwards` or `copyBackwards` and say which direction you meant.

## Builtins are not a standard library

There is a temptation to reach for a builtin because it looks lower level and therefore faster. Usually the `std` function is the same thing with a better name and error handling attached. Prefer `std.mem.eql` over hand-rolled comparison loops, and `std.math.add` over `@addWithOverflow` plus an `if`, unless the flag is genuinely what you want.
