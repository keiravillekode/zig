# Design

## Goal

Introduce floating point arithmetic and, more importantly, the fact that Zig never converts between integers and floats on its own.

## Learning objectives

- Know that `f32` and `f64` hold fractional values and that `f64` is the usual choice.
- Know that `/` on floats keeps the fractional part.
- Know that integers and floats never mix implicitly.
- Know how to use `@floatFromInt` and `@intFromFloat`, and that the latter truncates towards zero.
- Know that comparing computed floats with `==` is unreliable.

## Out of scope

- `f16`, `f80`, `f128` and `comptime_float`.
- NaN and the infinities.
- `@floor`, `@ceil` and `@round`.
- Why money should not be stored in a float, beyond a mention in the concept's about page.

## Concepts

- `floats`: `f64`, float division, `@floatFromInt` and `@intFromFloat`, approximate comparison.

## Prerequisites

- `integers`: needs the arithmetic operators and the idea that a numeric type is chosen deliberately.
- `type-coercion`: needs `@as` and the habit of converting explicitly.

## Analyzer

No analyzer support.
