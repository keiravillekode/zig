# Instructions

You are writing the software for a currency exchange machine at an airport. It deals only in whole notes, it has to be honest about the change, and the little counter on the front is only eight bits wide.

## 1. Work out how many notes to hand over

Define the `exchange` function, which takes the amount of money handed in and the price of one note of the foreign currency, and returns how many whole notes the customer gets.

```zig
exchange(127, 10)
// => 12
```

## 2. Work out the change

Whatever is left over goes back to the customer.

Define the `leftover` function, which takes the same two arguments and returns the amount that could not be exchanged.

```zig
leftover(127, 10)
// => 7
```

## 3. Top up the float without overflowing

The machine's cash float is tracked in a `u8`, and it must never wrap around to a small number when it is nearly full. Once it reaches 255 it simply stays there.

Define the `topUpFloat` function, which takes the current float and an amount to add, and returns the new float, stopping at the maximum instead of overflowing.

```zig
topUpFloat(250, 10)
// => 255
```

## 4. Advance the transaction counter

The display on the front counts transactions in a `u8` and is *meant* to roll over to zero after 255. That is a feature, not a bug.

Define the `advanceCounter` function, which takes the current count and how much to advance it by, and returns the new count, wrapping around on purpose.

```zig
advanceCounter(250, 10)
// => 4
```
