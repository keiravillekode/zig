# Design

## Goal

Teach the student that `@import` is the whole of Zig's module system, and that it works the same way for the standard library as for a file sitting next to theirs.

## Learning objectives

- Know that `@import` is a builtin that returns a struct.
- Know how to import the standard library as `std` and reach a nested namespace such as `std.math`.
- Know how to import another Zig file by path.
- Know that only `pub` declarations are visible to an importer.
- Know the convention of putting imports in `const` declarations at the top of a file.

## Out of scope

- Modules configured through `build.zig`.
- Circular imports.
- `@This()` and files as anonymous struct types.
- Anything about how the standard library is implemented.

## Concepts

- `importing`: `@import`, files as structs, `pub` visibility across files, reaching into the standard library.

## Prerequisites

- `basics`: needs to declare `const` values and write functions that call other functions.

## Analyzer

No analyzer support.
