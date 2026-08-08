# Introduction

Bitwise operators work on the individual bits of an integer rather than on the number it represents.

| Operator | Meaning |
| --- | --- |
| `a & b` | 1 where *both* have a 1 |
| `a \| b` | 1 where *either* has a 1 |
| `a ^ b` | 1 where they *differ* |
| `~a` | every bit flipped |
| `a << n` | shifted left, filling with zeros |
| `a >> n` | shifted right |

Binary literals make the effect easy to see:

```zig
0b1100 & 0b1010 // 0b1000
0b1100 | 0b1010 // 0b1110
0b1100 ^ 0b1010 // 0b0110
```

Most of the time these are used to treat one integer as a row of independent flags. A *mask* with a single bit set picks out one position:

```zig
const mask = @as(u8, 1) << position;
```

and then the three things you can do with it read almost as English:

```zig
state | mask       // turn that bit on
state & ~mask      // turn it off
(state & mask) != 0 // is it on?
```

The right-hand side of a shift has a type just wide enough to name a bit position: for a `u8` that is a `u3`, since 0 to 7 is all the positions there are. Shifting further than the type is wide is a bug, and the type stops you writing one.
