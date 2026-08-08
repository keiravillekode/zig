# About

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

## One language, two times

Most languages that do compile-time work invent a second language for it — macros, templates, a preprocessor. Zig runs *Zig*. The same `for`, the same `if`, the same functions. What changes is only when they run.

The rules for what may run at compile time are simple: no I/O, no system calls, and no dereferencing pointers to runtime memory. Everything else is fair game, including recursion and allocation from a compile-time buffer.

## Where `comptime` is implied

You rarely need to write the keyword. It is implicit in:

- the initialiser of a `const` at file scope, where it is required
- an array length, `[N]T`
- the value of an enum tag
- any argument to a builtin that takes a `type`
- the condition of `if` when both branches would otherwise have to be valid

`@compileError("...")` fails the build with a message, and is how compile-time code reports a bad argument. `@compileLog` prints values during compilation, for debugging that code.

## `comptime` parameters make types

The most important use of a compile-time parameter is not computing constants, it is producing types:

```zig
fn List(comptime T: type) type { ... }
```

That is the whole of Zig's [generics][generics], and it is only possible because `type` is an ordinary value at compile time.

## `inline for` is not an optimisation

`inline for` exists so that each turn of the loop can have a *different type* — walking the fields of a struct, or a tuple of mixed values. That is impossible with a runtime loop, because a runtime variable cannot change type.

Using it merely to unroll a small loop is usually a mistake: the compiler already does that when it helps, and unrolling a large loop bloats the binary and slows the build.

## What it costs

Compile-time execution happens in an interpreter, so a heavy `comptime` computation makes builds slow. A lookup table of sixteen entries is free; a table of ten million is a decision.

`@setEvalBranchQuota(n)` raises the limit when the compiler gives up on a long compile-time loop, which is the usual first sign you have asked for too much.

[generics]: https://ziglang.org/documentation/0.16.0/#Generic-Data-Structures
