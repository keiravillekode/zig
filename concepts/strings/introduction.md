# Introduction

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
