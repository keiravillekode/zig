# Introduction

Zig has no separate generics feature. A generic function is an ordinary function with a `comptime` parameter of type `type`:

```zig
fn firstOr(comptime T: type, items: []const T, fallback: T) T {
    if (items.len == 0) return fallback;
    return items[0];
}
```

`T` is a value like any other — it just happens to be a type, and it has to be known at compile time so that the rest of the signature can use it. The caller passes one in:

```zig
firstOr(u32, &scores, 0)
firstOr(u8, "abc", '?')
```

The compiler generates a separate copy of the function for each type it is called with, so there is no run-time cost and no boxing.

Generic *types* work the same way, because a function may return a `type`:

```zig
fn Box(comptime T: type) type {
    return struct {
        value: T,

        pub fn get(self: @This()) T {
            return self.value;
        }
    };
}
```

`Box(u32)` is then a type, used like any other:

```zig
const score = Box(u32){ .value = 10 };
```

By convention a function returning a type is named in `TitleCase`, because what you get back is a type. This is exactly how `std.ArrayList(T)` and `std.AutoHashMap(K, V)` are built — there is nothing special about them.
