# Instructions

You are writing the control software for a bomb disposal robot. Everything the robot does can fail, and the operator needs to know which way it failed — this is what error sets are for.

The exercise file already declares the error set you will use:

```zig
pub const DefusalError = error{
    WrongWire,
    OutOfTime,
};
```

## 1. Cut a wire

The blue wire is the safe one. Cutting anything else sets the bomb off.

Define the `cutWire` function, which takes a wire colour and returns nothing on success, or `error.WrongWire` if the colour is not `'b'`.

```zig
cutWire('r')
// => error.WrongWire
```

## 2. Read the timer

The bomb runs for 60 seconds from the moment the robot arrives.

Define the `secondsLeft` function, which takes the seconds elapsed and returns how many are left, or `error.OutOfTime` if 60 or more have already gone.

```zig
secondsLeft(45)
// => 15
```

## 3. Defuse the bomb

Define the `defuse` function, which takes a wire colour and the seconds elapsed. It checks the timer, cuts the wire, and returns the seconds remaining. If either step fails, that same error comes back to the caller — use `try` rather than handling anything here.

```zig
defuse('b', 45)
// => 15
```

## 4. Report to the operator

The operator's display cannot show an error, only a number. A failed defusal shows zero seconds remaining.

Define the `secondsOnDisplay` function, which takes a wire colour and the seconds elapsed and returns the seconds remaining, or `0` if the defusal failed.

```zig
secondsOnDisplay('r', 45)
// => 0
```
