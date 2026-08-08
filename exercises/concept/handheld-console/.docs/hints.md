# Hints

## General

- A `comptime` block that produces a value is written `comptime blk: { ... break :blk value; }`.
- A parameter marked `comptime` must be known to the caller, which is what lets it appear in the return type.
- If you get the error "unable to resolve comptime value", something the compiler needs to know early is only known late.

## 1. Bake the palette into the binary

- Declare the table as `var table: [16]u8 = undefined;` inside the block and fill it with a loop.
- The loop index is a `usize`, so `@intCast` is needed to store it in a `u8`.
- Because the whole block is `comptime`, the `var` there is a compile-time variable and disappears from the finished program.

## 2. Make a run of tiles

- The return type can mention the parameter directly: `[count]u8`.
- `[_]u8{value} ** count` builds the array in one expression.

## 3. Work out how many bits a value needs

- Count how many times the value can be halved before it reaches zero.
- A `comptime var` inside the function body can be used as the counter.

## 4. Add up the palette at compile time

- Wrap the whole sum in one `comptime` block so the answer is a single constant.
- Adding bytes will exceed 255, so use the wrapping add `+%=` rather than `+=`.
