# Hints

## General

- `&value` takes an address, and `pointer.*` reads or writes through it.
- A function that changes its caller's value has to take a pointer, because everything else is passed by copy.
- Reaching a field through a pointer needs nothing special: `link.id` works on a `*Link`.

## 1. Add a worker to the tally

- `tally.* += 1` reads through the pointer, adds, and writes back.

## 2. Swap two workers over

- You will need a temporary `const` to hold one value while you overwrite it.

## 3. Renumber a worker

- The parameter has to be a `*Link` rather than a `*const Link`, because you are writing to it.

## 4. Measure the chain

- The parameter type is `?*const Link`, so it can be `null`.
- `while (current) |link|` unwraps an optional each time round, exactly as `if` does, and stops when it is `null`.
- Move along the chain with `current = link.next;` inside the loop.
