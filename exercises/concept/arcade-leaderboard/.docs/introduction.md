# Introduction

A function declared inside a struct becomes a method of that struct:

```zig
const Leaderboard = struct {
    top_score: u32 = 0,

    pub fn isEmpty(self: Leaderboard) bool {
        return self.top_score == 0;
    }
};
```

There is nothing magic about `self`. It is an ordinary first parameter, and the name is only a convention. What is special is the call syntax: `board.isEmpty()` means `Leaderboard.isEmpty(board)`.

Taking `self` by value hands the method a copy, so it can read the struct but not change it. To change the caller's struct, take a pointer:

```zig
pub fn record(self: *Leaderboard, score: u32) void {
    if (score > self.top_score) self.top_score = score;
}
```

Zig takes the address for you at the call site, so `board.record(120)` still reads the same — though `board` then has to be a `var`.

A function inside a struct that has no `self` parameter is not a method, just a namespaced function. That is how constructors are written:

```zig
pub fn init() Leaderboard {
    return .{};
}
```

and called as `Leaderboard.init()`.

`@This()` gives a struct its own type from inside its body, so it is conventional to alias it and use that instead of repeating the name:

```zig
const Self = @This();
```
