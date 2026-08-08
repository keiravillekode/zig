# About

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

## Why `type` being a value is the whole trick

Once types are values that exist at compile time, generics need no new syntax. Functions already take parameters and return values, so a "generic type" is just a function, and a "type constraint" is just an `if` in that function.

## Duck typing, checked at compile time

There is no `where T: Comparable`. A generic function simply uses `T` however it likes, and the check happens when someone instantiates it:

```zig
fn largest(comptime T: type, items: []const T) T {
    var best = items[0];
    for (items[1..]) |item| {
        if (item > best) best = item; // fails to compile for a T with no `>`
    }
    return best;
}
```

Call it with `[]const u32` and it compiles. Call it with a struct and you get an error at the call site, pointing into the function body. That is late, and the error can be confusing — which is why library code often checks up front and produces its own message:

```zig
if (@typeInfo(T) != .int) @compileError("largest requires an integer type");
```

## Types are memoised

`Box(u32)` called twice gives the *same* type, not two identical ones. The compiler caches instantiations by their arguments, so `Box(u32) == Box(u32)` and values of them are interchangeable.

## `@This()` inside an anonymous struct

A struct returned from a function has no name to refer to itself by, so `@This()` is how its methods name their own type. `const Self = @This();` at the top of the body is the usual shape.

## Reflection

`@typeInfo(T)` lets generic code ask about a type — its kind, its fields, its child type — and `std.meta` wraps the common questions. It is what makes things like `std.meta.eql` possible, and what you will reach for the moment a generic function needs to behave differently for different shapes of `T`.

## What Zig gives up

There is no separate compilation of a generic: every instantiation is compiled fresh, so heavy generic code grows both the binary and the build time. And because there is no constraint syntax, the *contract* of a generic function lives in its documentation rather than its signature. Zig accepts both costs in exchange for having no second language for types.
