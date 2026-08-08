# Instructions

Your family is driving to the coast and the argument about music has already started. You are going to settle it in software, building playlists whose length is not known until they are built — which is what `std.ArrayList` is for.

A track is a `[]const u8` and a playlist is a `[][]const u8`. Every function here hands its playlist to the caller, who frees it.

## 1. Collect the tracks

Define the `collect` function, which takes an allocator and a list of tracks, and returns a freshly allocated playlist holding them all in the same order.

```zig
const playlist = try collect(allocator, &.{ "Blue Monday", "Roadrunner" });
defer allocator.free(playlist);
// playlist is { "Blue Monday", "Roadrunner" }
```

## 2. Leave out the banned track

Your sister has vetoed one song.

Define the `withoutBanned` function, which takes an allocator, a list of tracks and a banned track, and returns a playlist with every copy of that track left out.

```zig
const playlist = try withoutBanned(allocator, &.{ "Blue Monday", "Barbie Girl" }, "Barbie Girl");
defer allocator.free(playlist);
// playlist is { "Blue Monday" }
```

## 3. Put one track on repeat

Define the `repeatTrack` function, which takes an allocator, a track and a count, and returns a playlist holding that track that many times.

```zig
const playlist = try repeatTrack(allocator, "Blue Monday", 3);
defer allocator.free(playlist);
// playlist is { "Blue Monday", "Blue Monday", "Blue Monday" }
```

## 4. Take turns

Everyone has their own list, and the only fair thing is to alternate.

Define the `interleave` function, which takes an allocator and two lists of tracks, and returns a playlist alternating between them, starting with the first. When one list runs out, the rest of the other follows on.

```zig
const playlist = try interleave(allocator, &.{ "a", "c" }, &.{ "b", "d", "e" });
defer allocator.free(playlist);
// playlist is { "a", "b", "c", "d", "e" }
```
