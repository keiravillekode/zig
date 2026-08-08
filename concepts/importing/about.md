# About

Zig has no `#include` and no `import` statement. It has one builtin, `@import`, which hands back a struct:

```zig
const std = @import("std");
```

`std` is now an ordinary constant, and every public declaration in the standard library is reached through it with a dot:

```zig
const capped = std.math.clamp(value, 0, 100);
```

`@import` takes a string. `"std"` means the standard library. Any other string is the path of a Zig file sitting next to the one doing the importing:

```zig
const catalog = @import("catalog.zig");
```

Every Zig file *is* a struct, so importing one gives you everything it declares `pub`. Anything not marked `pub` stays private to its own file.

By convention imports are `const` declarations at the top of the file, named after whatever they bring in.

## Files really are structs

"Every file is a struct" is not a metaphor. A file with these contents:

```zig
// point.zig
pub const origin = 0;

pub fn shift(n: i32) i32 {
    return n + 1;
}
```

behaves exactly as if you had written `struct { pub const origin = 0; pub fn shift(...) ... }`. That is why `@import` returns something you reach into with a dot, and why the same dot syntax works for a struct you declared yourself.

The type of what `@import` returns is `type`, so it can be passed around like any other compile-time value.

## Importing happens at compile time

`@import` is resolved by the compiler, not at run time. The argument has to be a string literal — you cannot compute a path and import it. In exchange, an unused import costs nothing in the final binary, and the compiler can check every name you reach for.

Two files may import each other. Because imports are resolved lazily, circular imports are allowed and are common in the standard library.

## Narrowing what you bring in

It is normal to pull a nested namespace out into its own constant when you use it a lot:

```zig
const std = @import("std");
const mem = std.mem;
const testing = std.testing;
```

You can go further and import a single function, though the convention is to stop at the namespace so that call sites still say where a function came from:

```zig
const eql = @import("std").mem.eql; // legal, but `mem.eql(...)` reads better
```

## Packages

`@import` also accepts a *module name* configured by the build system, which is how third-party code is pulled in. Exercism exercises are single files compiled directly with `zig test`, so the only names you will use here are `"std"` and the paths of files in the same directory.

## Finding your way around the standard library

The standard library is large and its documentation is generated from the source. The namespaces that come up most often are [`std.mem`][mem] for working with slices, [`std.math`][math] for numeric helpers, [`std.fmt`][fmt] for formatting, and [`std.testing`][testing] for the assertions the exercises use.

[mem]: https://ziglang.org/documentation/0.16.0/std/#std.mem
[math]: https://ziglang.org/documentation/0.16.0/std/#std.math
[fmt]: https://ziglang.org/documentation/0.16.0/std/#std.fmt
[testing]: https://ziglang.org/documentation/0.16.0/std/#std.testing
