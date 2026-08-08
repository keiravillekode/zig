# About

A struct groups related values under named fields. Declaring one creates a new type, which is why it is bound to a `const`:

```zig
const Vehicle = struct {
    plate: []const u8,
    speed_kph: u32,
};
```

By convention type names are `TitleCase` while field names are `snake_case`.

A value is built by naming the type and then each field, with a leading dot:

```zig
const car = Vehicle{ .plate = "AB12 CDE", .speed_kph = 48 };
```

Every field has to be given a value, unless the declaration supplies a default:

```zig
const Vehicle = struct {
    plate: []const u8,
    speed_kph: u32,
    warnings: u32 = 0,
};

const car = Vehicle{ .plate = "AB12 CDE", .speed_kph = 48 }; // warnings is 0
```

Fields are read and written with a dot:

```zig
const fast = car.speed_kph > 50;
```

Where the type is already known — a function's parameter or return type, or a variable's annotation — it can be left out and written `.{ ... }`:

```zig
fn record(plate: []const u8) Vehicle {
    return .{ .plate = plate, .speed_kph = 0 };
}
```

A struct is a value. Assigning one copies it, so changing the copy leaves the original alone.

## Structs are values, and that matters

```zig
var a = Vehicle{ .plate = "AB12 CDE", .speed_kph = 48 };
var b = a;
b.speed_kph = 90; // a.speed_kph is still 48
```

Passing a struct to a function copies it too, so a function cannot change its caller's struct unless it is given a [pointer][pointers] to one. That is a deliberate default: nothing changes behind your back.

## Field order is not guaranteed

Zig reorders fields to pack them efficiently, so `@sizeOf` may be smaller than the sum of the parts and the layout is not the order you wrote. When the layout has to match something outside the program — a file format, a C struct — say so with `extern struct` or `packed struct`.

## Declaring things inside a struct

A struct body holds more than fields. Constants, other types and functions can all live there, and they are namespaced under the struct rather than stored in each value:

```zig
const Vehicle = struct {
    const max_plate_length = 8;

    plate: []const u8,
    speed_kph: u32,
};
```

`Vehicle.max_plate_length` reaches it. Functions declared this way become [methods][methods], the next concept on the syllabus.

## Anonymous struct literals

`.{ ... }` with no type name in front takes its type from context. With no field names at all it produces a *tuple*, whose fields are numbered:

```zig
const pair = .{ "AB12 CDE", 48 };
const plate = pair[0];
```

Tuples are how `std.debug.print` accepts a variable number of arguments.

## Comparing structs

There is no `==` for structs. Compare the fields you care about, or use `std.meta.eql(a, b)` for a field-by-field comparison. In tests, `std.testing.expectEqualDeep` does the same job and reports which field differed.

## Every file is a struct

A Zig file behaves exactly like a struct body, which is why `@import` hands you something you reach into with a dot. `@This()` inside a struct gives you the struct's own type, which is how a type refers to itself.

[pointers]: https://ziglang.org/documentation/0.16.0/#Pointers
[methods]: https://ziglang.org/documentation/0.16.0/#struct
