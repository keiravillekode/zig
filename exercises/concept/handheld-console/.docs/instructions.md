# Instructions

You are squeezing a game onto a handheld console with almost no memory and a very slow processor. The trick is to do as much work as possible before the game ever runs, while it is still being compiled.

## 1. Bake the palette into the binary

The console's 16-colour palette is worked out by a formula, but it must not be worked out while the game is running.

Define the `palette` function, which takes no arguments and returns a `[16]u8` whose entry at index `i` is `i * 17`. Build the table in a `comptime` block so that the loop runs during compilation.

```zig
palette()[2]
// => 34
```

## 2. Make a run of tiles

Define the `tiles` function, which takes a count and a tile value and returns an array of that many copies. The count has to be a `comptime` parameter, because it is the length of the returned array.

```zig
tiles(3, 'x')
// => { 'x', 'x', 'x' }
```

## 3. Work out how many bits a value needs

Sprite indices are packed as tightly as they will go, so the game needs to know how many bits it takes to hold the largest one. Zero needs no bits at all.

Define the `bitsNeeded` function, which takes a `comptime` highest value and returns how many bits are needed to represent it.

```zig
bitsNeeded(255)
// => 248
```

## 4. Add up the palette at compile time

Define the `paletteChecksum` function, which takes no arguments and returns the sum of every entry of the palette, wrapping within a `u8`. Do the whole sum at compile time so that the running game only ever loads a constant.

```zig
paletteChecksum()
// => 248
```
