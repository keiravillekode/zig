# Instructions

You letter signs for the shops on the high street. The workshop's software has to read what a sign says and work out what it costs to paint.

Every sign here is a `[]const u8`.

## 1. Count the letters

Define the `letterCount` function, which takes a sign and returns how many bytes it contains.

```zig
letterCount("OPEN")
// => 4
```

## 2. Recognise an OPEN sign

Define the `saysOpen` function, which takes a sign and returns whether it says exactly `OPEN`. Remember that `==` on two slices does not compare their contents.

```zig
saysOpen("OPEN")
// => true
```

## 3. Recognise a for-sale sign

An estate agent's board always begins `FOR SALE`, whatever else it goes on to say.

Define the `isForSale` function, which takes a sign and returns whether it begins with `FOR SALE`.

```zig
isForSale("FOR SALE BY AUCTION")
// => true
```

## 4. Price a sign

You charge 3 pence for every character you actually have to paint. Spaces cost nothing.

Define the `paintCost` function, which takes a sign and returns its cost in pence.

```zig
paintCost("FOR SALE")
// => 21
```
