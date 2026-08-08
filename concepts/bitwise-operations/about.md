# About

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

## Why the shift amount has such a narrow type

`value << amount` on a `u8` requires `amount` to be a `u3`. That is not fussiness: shifting a `u8` by 8 or more has no sensible answer, and different CPUs give different ones. Making the type unable to express the mistake is cheaper than checking for it.

`std.math.Log2Int(T)` names that type when you need it generically. `@shlExact` and `@shrExact` are the variants that assert no bits are lost.

## Shifting is not multiplication

`x << 1` and `x * 2` agree until the top bit shifts out, at which point `*` traps and `<<` also traps in a safe build. `<<|` saturates instead. Write the multiplication when you mean arithmetic and the shift when you mean bits; any compiler worth using produces the same instruction.

## Signed integers

`~`, `&`, `|` and `^` operate on the two's complement representation, so `~@as(i8, 0)` is `-1`. `>>` on a signed integer is an *arithmetic* shift: it copies the sign bit down, so `-8 >> 1` is `-4`.

## The counting builtins

Several bit operations are builtins rather than operators, because they map to single CPU instructions:

- `@popCount(x)` — how many bits are set
- `@clz(x)`, `@ctz(x)` — leading and trailing zeros
- `@byteSwap(x)`, `@bitReverse(x)`

## Flags as a set

An enum with explicit power-of-two values, combined with `|`, is the classic C way to pass a set of options. Zig has a better one: `std.EnumSet`, which is the same bitmask underneath but keeps the names and the type checking.

## Bit fields

When you want named fields of specific widths rather than an anonymous mask, a `packed struct` gives you both:

```zig
const Tumblers = packed struct(u8) {
    a: bool, b: bool, c: bool, d: bool,
    e: bool, f: bool, g: bool, h: bool,
};
```

It is exactly one byte, `@bitCast` converts to and from `u8`, and the fields have names. Prefer this to hand-written masks whenever the positions mean something.
