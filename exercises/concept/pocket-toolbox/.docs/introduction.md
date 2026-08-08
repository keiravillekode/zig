# Introduction

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
