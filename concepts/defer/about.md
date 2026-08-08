# About

`defer` schedules a statement to run when the current block exits:

```zig
{
    lock();
    defer unlock();
    doWork();
}
```

`unlock()` runs after `doWork()`, whichever way the block is left — off the end, through a `return`, or because an error was propagated. The point is that the cleanup sits next to the thing it cleans up, instead of being repeated at the bottom of every path out.

Several defers run in reverse order, last scheduled first:

```zig
open();
defer close(); // runs second
cork();
defer uncork(); // runs first
```

That is what you want, because the thing set up last usually has to be taken down first.

`defer` is tied to the *block*, not the function, so one inside a loop body runs at the end of every turn:

```zig
for (0..3) |_| {
    pour();
    defer wash(); // pour, wash, pour, wash, pour, wash
}
```

`errdefer` is the same idea but only fires when the block is left by returning an error. It is for undoing half-finished work:

```zig
const glass = try fetchGlass();
errdefer returnGlass(glass);
try pour(glass); // if this fails, the glass goes back
```

## Why this is better than a cleanup block at the bottom

A function with several failure points needs its cleanup on every one of them. In languages without `defer` that becomes a `goto` chain, a nest of `if`s, or a `finally`. `defer` puts one line right after the acquisition and is done, and adding a new early return later cannot forget it.

The pairing it produces is the standard shape in Zig:

```zig
const buffer = try allocator.alloc(u8, size);
defer allocator.free(buffer);
```

Two adjacent lines, impossible to get out of step.

## Scope, not function

Because the block is the unit, a `defer` inside an `if` or a loop body fires at the end of that block. Occasionally that is a surprise:

```zig
for (files) |name| {
    const file = try open(name);
    defer file.close(); // closes each file at the end of its turn — good
}
```

and occasionally it is what you must avoid:

```zig
for (files) |name| {
    const file = try open(name);
    // no defer: this file must stay open past the loop
}
```

## What may not be deferred

A deferred statement may not `return`, and it may not propagate an error with `try` — there is nowhere for either to go. If a cleanup can fail, handle the failure inside the defer:

```zig
defer file.sync() catch {};
```

## `errdefer` and the capture form

`errdefer` runs only on the error path, so it is the tool for building something that must be released if a later step fails. It can capture the error, which is useful for logging:

```zig
errdefer |err| std.log.warn("giving up: {}", .{err});
```

A common bug is using `defer` where `errdefer` was meant, and freeing the very thing you were about to return successfully.

## Order with respect to the return value

The return value is computed first, then the defers run, then the function returns. So a `defer` can modify a variable the function has already read, and the caller will not see the change — which is occasionally surprising and mostly a good thing.
