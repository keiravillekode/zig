# Introduction

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
