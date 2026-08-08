# About

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

## A slice does not own anything

A slice is a *view*. It points at memory that something else owns — an array on the stack, a buffer from an [allocator][memory], a string literal in the binary. Nothing is copied when you slice, and nothing is freed when the slice goes out of scope.

The consequence is the one real hazard: a slice must not outlive what it points at.

```zig
fn broken() []const u8 {
    var buffer = [_]u8{ 'h', 'i' };
    return &buffer; // the array dies when this function returns
}
```

Returning a slice of a local array is the classic mistake. Return the array by value, write into a caller-supplied buffer, or allocate — the exercises use all three.

## `const` in the right place

`[]const u8` and `const slice: []u8` mean different things:

- `[]const u8` — the *elements* cannot be written through this slice.
- `const s: []u8` — the *slice itself* cannot be repointed, but the elements can be written.

Take `[]const u8` in a function signature unless you intend to modify the caller's data. A `[]u8` coerces to a `[]const u8` automatically, so the const version accepts more callers.

## Slicing with compile-time known bounds

If both ends of the range are known at compile time, the result is a *pointer to an array*, `*[N]T`, not a slice — it keeps the exact length in its type. It coerces to a slice the moment you need one, so this rarely matters, but it is why `array[0..2]` sometimes has a surprising type in an error message.

## Sentinel-terminated slices

`[:0]const u8` is a slice whose elements are followed by a guaranteed zero. String literals produce these, which is how Zig hands strings to C without losing its own length. A `[:0]const u8` coerces to `[]const u8` freely.

## The standard library works in slices

`std.mem` is a large box of slice tools: `eql`, `indexOf`, `startsWith`, `trim`, `copyForwards`, `sort`, `splitScalar`, `tokenizeScalar`. Anything you are about to write a loop for is worth looking for there first.

[memory]: https://ziglang.org/documentation/0.16.0/#Memory
