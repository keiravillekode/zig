# Instructions

Somebody has taken the school mascot, and the ransom note was cut out of a magazine. You are helping the police work out whether a particular magazine could have produced a particular note — which comes down to counting letters.

Spaces do not have to be cut out, so ignore them everywhere.

## 1. Count the letters in a text

Define the `letterCounts` function, which takes an allocator and a text, and returns a map from each letter to how many times it appears. Spaces are not counted.

The caller owns the map and will `deinit` it.

```zig
var counts = try letterCounts(allocator, "abba");
defer counts.deinit();
// counts.get('a') is 2, counts.get('b') is 2
```

## 2. Read a count safely

Define the `countOf` function, which takes a pointer to a counts map and a letter, and returns how many of that letter there are — zero if the letter is not in the map at all.

```zig
countOf(&counts, 'z')
// => 0
```

## 3. Count the distinct letters

Define the `distinctLetters` function, which takes an allocator and a text, and returns how many different letters it uses.

```zig
distinctLetters(allocator, "abba")
// => 2
```

## 4. Decide whether the note could be cut

Define the `canCut` function, which takes an allocator, the note and the magazine, and returns whether the magazine contains at least as many of every letter as the note needs.

```zig
canCut(allocator, "ab", "abba")
// => true
```
