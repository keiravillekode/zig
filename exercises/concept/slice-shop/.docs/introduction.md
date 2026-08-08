# Introduction

A slice is a pointer to some elements plus a count of how many there are. Its type is written `[]T`, with nothing between the brackets, because the length is not part of the type — it is carried alongside at run time:

```zig
const scores: []const u32 = ...;
const how_many = scores.len;
```

Slicing an array with a range produces one, without copying any elements:

```zig
var pizza = [_]u8{ 'a', 'b', 'c', 'd', 'e' };
const middle = pizza[1..4]; // 'b', 'c', 'd'
```

The range includes the first index and stops before the second, so `pizza[1..4]` has three elements. `pizza[0..]` runs to the end.

A whole array becomes a slice by taking its address with `&`:

```zig
const all: []u8 = &pizza;
```

`[]const T` is a slice you may only read. `[]T` is one you may also write through, and writing through it changes the original array:

```zig
const first_two: []u8 = pizza[0..2];
first_two[0] = 'z'; // pizza[0] is now 'z' too
```

Slices are indexed and iterated exactly like arrays, and indexing past `.len` stops the program.

Because a slice does not carry its length in its type, one function can accept any number of elements — which is why almost every function in the standard library takes slices rather than arrays.
