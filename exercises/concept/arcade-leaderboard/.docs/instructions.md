# Instructions

The arcade's high score table has been kept on a scrap of paper for years, and the owner has finally asked you to write it properly. This time the functions live inside the struct.

The exercise file already declares the struct:

```zig
pub const Leaderboard = struct {
    top_player: []const u8 = "nobody",
    top_score: u32 = 0,
    plays: u32 = 0,
};
```

Every field has a default, so `.{}` builds a complete value.

## 1. Start a new leaderboard

Define `init` inside the struct. It takes no arguments and returns a fresh `Leaderboard`.

```zig
Leaderboard.init().top_score
// => 0
```

## 2. Say whether a score would take the top spot

Define the `beats` method, which takes the leaderboard and a score, and returns whether that score is higher than the current top score.

```zig
Leaderboard.init().beats(120)
// => true
```

## 3. Record a play

Every game played adds one to `plays`, whatever the score. A score that beats the top spot also replaces `top_player` and `top_score`.

Define the `record` method, which takes a player and a score and returns nothing. It has to change the leaderboard it is called on.

```zig
var board = Leaderboard.init();
board.record("ada", 120);
// board.top_player is now "ada"
```

## 4. Clear the table

Define the `reset` method, which takes no arguments beyond the leaderboard and returns nothing, putting it back to how `init` left it. Assign a whole new value over the old one rather than clearing the fields one at a time.

```zig
board.reset();
// board.plays is now 0
```
