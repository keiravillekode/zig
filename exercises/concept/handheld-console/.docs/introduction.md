# Introduction

Zig can run your code while it compiles. The `comptime` keyword marks the places where it does.

A `comptime` block runs during compilation, and whatever it leaves behind is baked into the program as a constant:

```zig
const palette = comptime blk: {
    var table: [16]u8 = undefined;
    for (0..16) |i| table[i] = @intCast(i * 17);
    break :blk table;
};
```

That loop never runs when the program does. The finished array is in the binary.

A `comptime` parameter is one the caller must already know the value of. That lets the function use it where only a constant will do — such as the length of an array in its own return type:

```zig
fn repeat(comptime count: usize, value: u8) [count]u8 {
    return [_]u8{value} ** count;
}
```

`repeat(3, 'x')` compiles; `repeat(n, 'x')` for a runtime `n` does not, and the error says so.

`inline for` unrolls a loop at compile time, so the loop variable is a constant on every turn:

```zig
inline for (0..4) |i| {
    total += table[i];
}
```

You have met compile-time values before without the keyword. A number literal is a `comptime_int`, an array's length is compile-time knowledge, and every `@` builtin taking a type is taking a compile-time argument. `comptime` just makes that machinery available to you directly.
