# Instructions

You have been handed the maintenance software for a bank vault. The lock has eight tumblers, and their state is kept in a single `u8`: bit 0 is the first tumbler, bit 7 the last, and a `1` means that tumbler is raised.

A tumbler's position is a `u3`, which is exactly wide enough to name one of the eight.

## 1. Raise a tumbler

Define the `raise` function, which takes the lock's state and a tumbler position, and returns the state with that tumbler raised. A tumbler that is already raised stays raised.

```zig
raise(0b0000_0000, 2)
// => 0b0000_0100
```

## 2. Drop a tumbler

Define the `drop` function, which takes the state and a position, and returns the state with that tumbler lowered. A tumbler that is already down stays down.

```zig
drop(0b0000_0101, 2)
// => 0b0000_0001
```

## 3. Check a tumbler

Define the `isRaised` function, which takes the state and a position, and returns whether that tumbler is raised.

```zig
isRaised(0b0000_0100, 2)
// => true
```

## 4. Compare against the combination

Define the `wrongTumblers` function, which takes the current state and the correct combination, and returns a value whose bits are set exactly where the two disagree.

```zig
wrongTumblers(0b0000_0101, 0b0000_0001)
// => 0b0000_0100
```
