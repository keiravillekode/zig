# Introduction

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
