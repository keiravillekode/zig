# About

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

## Single-item and many-item pointers

`*T` points at exactly one `T`. It cannot be indexed and cannot do arithmetic, because there is no second element for it to reach.

`[*]T` is a *many-item* pointer: it can be indexed and offset, but it does not know how many items there are. It exists mainly for talking to C.

In between sits the [slice][slices], `[]T`, which is a many-item pointer plus a length. That is the one to use in Zig code: it carries the information that makes bounds checking possible.

## `?*T` costs nothing

An optional pointer is the same size as a pointer, because the address zero is used to mean `null`. So the safety is free, and there is no reason to reach for a "null pointer" convention of your own.

## `const` on either side

```zig
var value: u32 = 1;
const p: *u32 = &value;        // the pointer is fixed, the value can change
var q: *const u32 = &value;    // the pointer can move, the value is read-only
```

`*T` coerces to `*const T`, so taking `*const T` in a signature accepts more callers and promises more.

## Taking the address of a temporary

`&` needs something with an address. A `const` initialised with a literal has one — Zig gives it static storage — so `&some_const` is fine and lives for the whole program. What is *not* fine is returning a pointer to a local variable:

```zig
fn broken() *u32 {
    var n: u32 = 1;
    return &n; // n is gone the moment this returns
}
```

The compiler does not catch this. It is the one place Zig asks you to think, and the reason [allocators][memory] exist.

## Pointers in captures

`for (items) |*item|` and `if (opt) |*value|` capture pointers rather than copies, which is how you modify what you are iterating over:

```zig
for (scores) |*score| {
    score.* *= 2;
}
```

## Alignment

Every pointer type carries an alignment, usually inferred. `@alignCast` and the `align()` modifier appear when interoperating with hardware or C; ordinary Zig rarely mentions them.

[slices]: https://ziglang.org/documentation/0.16.0/#Slices
[memory]: https://ziglang.org/documentation/0.16.0/#Memory
