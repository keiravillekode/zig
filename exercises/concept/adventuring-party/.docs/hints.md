# Hints

## General

- A switch on a tagged union captures the payload: `.wizard => |power| power`.
- A case with no payload, such as `.mascot`, has nothing to capture.
- Listing every case means no `else`, which is what makes a new kind of member a compile error rather than a silent zero.

## 1. Work out a member's damage

- The warrior's payload is a struct, so the capture gives you the whole `Warrior` and you take the field you want from it.

## 2. Work out a member's armour

- Three of the four cases return the same thing, and cases can be combined: `.wizard, .healer, .mascot => 0`.

## 3. Name a member's kind

- `@tagName` works on a tagged union just as it does on an enum.

## 4. Add up the party's damage

- The parameter is a slice, `[]const Member`, so a `for` loop walks it.
