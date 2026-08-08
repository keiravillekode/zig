# Instructions

You are calibrating the software in a roadside weigh station. Each axle sits on its own sensor, and every part of the machine wants the numbers in a different size.

- Each sensor reports its axle's load as a `u8`, in hundreds of kilograms.
- The totals board is a `u32`.
- The little roadside display is a `u16`.
- The checksum sent to head office is a single byte.

## 1. Add up the axles

Three axles can easily add up to more than a `u8` can hold, so the sum has to be done in a wider type.

Define the `totalWeight` function, which takes three axle readings and returns their total as a `u32`.

```zig
totalWeight(200, 200, 200)
// => 600
```

## 2. Send the total to the display

The display is only 16 bits wide, but the station is never asked to show a total that would not fit.

Define the `displayWeight` function, which takes the total as a `u32` and returns it as a `u16`. Choose the conversion that treats an oversized value as a bug.

```zig
displayWeight(600)
// => 600
```

## 3. Work out the checksum byte

Head office wants the bottom eight bits of the total, and throwing the rest away is exactly what is wanted here.

Define the `checksumByte` function, which takes the total as a `u32` and returns its low byte.

```zig
checksumByte(600)
// => 88
```

## 4. Decide whether the lorry is overloaded

The limit is configured as a `u16` while the total is a `u32`. Compare them directly and let Zig widen the limit for you.

Define the `isOverloaded` function, which takes the total and the limit, and returns whether the total is above the limit.

```zig
isOverloaded(600, 500)
// => true
```
