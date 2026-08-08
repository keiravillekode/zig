# About

Zig has no string type. A string is a slice of bytes, `[]const u8`, and a string literal is one:

```zig
const sign: []const u8 = "FOR SALE";
```

Everything you know about slices applies: `.len` is the number of *bytes*, indexing gives a `u8`, and `for` walks it one byte at a time.

```zig
for (sign) |byte| { ... }
```

Because a string is a slice, `==` compares the pointer and length rather than the letters. To compare contents, use the standard library:

```zig
std.mem.eql(u8, sign, "FOR SALE")   // true
std.mem.startsWith(u8, sign, "FOR") // true
```

The usual escapes work inside a literal — `\n`, `\t`, `\"`, `\\` and `\xNN` for a raw byte. A multiline literal instead prefixes each line with `\\`, and takes no escapes at all:

```zig
const notice =
    \\OPEN
    \\9 till 5
;
```

Zig source is UTF-8, so a literal containing non-ASCII characters holds more bytes than it does characters. `.len` counts bytes; that distinction only starts to matter once a sign says something like `CAFÉ`.

## What a literal actually is

`"hi"` has type `*const [2:0]u8`: a pointer to a constant, zero-terminated array of two bytes. The zero is there so the literal can be handed to C, and it is not counted in `.len`. The literal coerces to `[]const u8` wherever one is wanted, which is why you rarely have to think about any of this.

Literals live in the binary's constant data, so a slice of one is valid for the whole run of the program — unlike a slice of a local array.

## Bytes, code points, graphemes

Three different things get called "length":

- `sign.len` — bytes.
- `try std.unicode.utf8CountCodepoints(sign)` — Unicode code points.
- graphemes, what a reader would call characters — a much harder problem, and not in the standard library.

For ASCII all three agree. For `"café"` the byte length is 5 and the code point count is 4. Iterating with `for (sign) |byte|` walks bytes, which will split a multi-byte character; `std.unicode.Utf8View` iterates code points instead.

## The `std.mem` toolbox

Almost everything you want to do to a string is a slice operation:

| Want | Function |
| --- | --- |
| compare contents | `std.mem.eql(u8, a, b)` |
| find a substring | `std.mem.indexOf(u8, haystack, needle)` |
| test either end | `std.mem.startsWith`, `std.mem.endsWith` |
| strip characters | `std.mem.trim(u8, s, " ")` |
| split on a separator | `std.mem.splitScalar(u8, s, ',')` |
| split, ignoring empties | `std.mem.tokenizeScalar(u8, s, ' ')` |

`std.ascii` has the byte-level classifiers and case conversions — `isAlphabetic`, `isDigit`, `toUpper` — plus `eqlIgnoreCase`.

## Building strings

A string is just bytes, so producing a new one means finding somewhere to put them. Zig gives you three choices, in increasing order of power: write into a buffer the caller supplied, use `std.fmt.bufPrint` to format into one, or ask an [allocator][memory] for the space. Nothing happens implicitly, and no string is ever silently copied.

## Comparing with `==`

`a == b` on two slices compiles, and compares pointers, not contents. It is almost never what you want, and it is the single most common mistake for people arriving from a language with a real string type. Reach for `std.mem.eql`.

[memory]: https://ziglang.org/documentation/0.16.0/#Memory
