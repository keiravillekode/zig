# Instructions

The council has put a speed camera on the road outside your school and asked you to write the software that processes what it sees.

The exercise file already declares the record the camera produces:

```zig
pub const Vehicle = struct {
    plate: []const u8,
    speed_kph: u32,
    warnings: u32 = 0,
};
```

Note that `warnings` has a default, so you do not have to give it a value every time.

## 1. Record a vehicle

Define the `record` function, which takes a number plate and a speed and returns a `Vehicle`. A newly recorded vehicle has no warnings, so let the default do that work.

```zig
record("AB12 CDE", 48)
// => Vehicle{ .plate = "AB12 CDE", .speed_kph = 48, .warnings = 0 }
```

## 2. Decide whether a vehicle is speeding

Define the `isSpeeding` function, which takes a vehicle and the limit, and returns whether the vehicle was above the limit. Driving at exactly the limit is not speeding.

```zig
isSpeeding(record("AB12 CDE", 48), 30)
// => true
```

## 3. Add a warning

A vehicle that is speeding gets a warning added to its record. Because a struct is a value, this returns a *new* vehicle rather than changing the one it was given.

Define the `warn` function, which takes a vehicle and returns a copy with one more warning.

```zig
warn(record("AB12 CDE", 48)).warnings
// => 1
```

## 4. Work out the fine

A fine is £10 for every kilometre per hour above the limit. A vehicle that is not speeding pays nothing.

Define the `fineInPounds` function, which takes a vehicle and the limit and returns the fine.

```zig
fineInPounds(record("AB12 CDE", 48), 30)
// => 180
```
