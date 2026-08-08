# Introduction

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
