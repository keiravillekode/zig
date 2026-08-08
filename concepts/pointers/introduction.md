# Introduction

A pointer holds the address of a value stored somewhere else. Its type is `*T`:

```zig
var count: u32 = 3;
const p: *u32 = &count;
```

`&` takes the address of something, and `.*` reads or writes through the pointer:

```zig
p.* = p.* + 1; // count is now 4
```

Because Zig passes everything by value, a pointer is how a function changes its caller's data:

```zig
fn increment(value: *u32) void {
    value.* += 1;
}

increment(&count);
```

`*const T` points at something you may only read. Prefer it whenever a function does not need to write.

Reaching a field or calling a method through a pointer needs no special syntax — a plain dot does it, and `pointer.field` means `pointer.*.field`:

```zig
fn rename(vehicle: *Vehicle) void {
    vehicle.plate = "NEW 1";
}
```

A pointer can never be null. When "no pointer" is a possibility, say so with an [optional][optionals], `?*T`, and the compiler will make you handle the empty case:

```zig
var next: ?*Link = null;
```

[optionals]: https://ziglang.org/documentation/0.16.0/#Optionals
