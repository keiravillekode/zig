# Instructions

You are automating the service routine in a restaurant's wine cellar. Every action leaves a mark in the service log, and the whole point of the exercise is *when* those marks appear.

The exercise file already declares the log:

```zig
pub const Log = struct {
    entries: [32]u8 = undefined,
    len: usize = 0,

    pub fn add(self: *Log, entry: u8) void {
        self.entries[self.len] = entry;
        self.len += 1;
    }

    pub fn text(self: *const Log) []const u8 {
        return self.entries[0..self.len];
    }
};
```

## 1. Pour and wash

Pouring a glass records `'p'`. The glass always has to be washed afterwards, recording `'w'`.

Define the `pourGlass` function, which takes a pointer to a log and returns nothing. Record the pour, then schedule the wash with `defer` rather than calling it directly.

```zig
pourGlass(&log);
log.text()
// => "pw"
```

## 2. Open a bottle for the evening

Opening a bottle records `'o'`. At the end of the evening it has to be corked, recording `'c'`, and only then can the cellar be locked, recording `'l'`.

Define the `openBottle` function, which takes a pointer to a log and returns nothing. Record the opening, then schedule both the corking and the locking with `defer`, in whichever order gives `"ocl"`.

```zig
openBottle(&log);
log.text()
// => "ocl"
```

## 3. Serve a round

Define the `serveRound` function, which takes a pointer to a log and a number of glasses, and returns nothing. Pour and wash each glass in a loop, so that a round of three reads `"pwpwpw"` rather than `"pppwww"`.

```zig
serveRound(&log, 3);
log.text()
// => "pwpwpw"
```

## 4. Send a bottle up

Sending a bottle to the restaurant records `'s'`. If it arrives, that records `'d'`. If the bottle turns out to be corked the delivery fails with `error.Spoiled`, and the bottle has to be returned to the cellar, recording `'r'`.

Define the `sendBottle` function, which takes a pointer to a log and whether the bottle is sound, and returns `!void`. Schedule the return with `errdefer`, so that it only happens when the delivery fails.

```zig
try sendBottle(&log, true);
log.text()
// => "sd"
```
