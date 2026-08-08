# Hints

## General

- A deferred statement runs when its *block* ends, however the block is left.
- Several defers in one block run in reverse order, the last one scheduled going first.
- `log.add('p')` records a single mark.

## 1. Pour and wash

- Record the pour first, then write `defer log.add('w');`.

## 2. Open a bottle for the evening

- Both marks come from `defer`, so think about which order they will run in.
- The one you want to happen last is the one you schedule first.

## 3. Serve a round

- Put the pour and the `defer` inside the loop body, and the defer will fire at the end of each turn.
- A `for (0..glasses) |_|` loop runs the right number of times without needing the counter.

## 4. Send a bottle up

- `errdefer` runs only when the function returns an error, which is exactly the difference you want here.
- Record the send, schedule the return with `errdefer`, then either return the error or record the delivery.
