# Instructions

Tech Palace opens tomorrow, and the owner has already written the shop's `catalog.zig` file with the opening times and the prices in it. You cannot change that file, but you can import it.

Your job is the till software, in `tech_palace_opening.zig`.

## 1. Report the opening hour

Import `catalog.zig` and define the `openingHour` function, which takes no arguments and returns the hour the doors open.

```zig
openingHour()
// => 9
```

## 2. Work out how long the shop is open

Define the `hoursOpenEachDay` function, which takes no arguments and returns the number of hours between opening and closing.

```zig
hoursOpenEachDay()
// => 12
```

## 3. Price a bundle

A customer can buy any number of televisions and speakers together.

Define the `bundleCost` function, which takes a number of televisions and a number of speakers, and returns what the whole bundle costs. The catalog already knows how to work this out.

```zig
bundleCost(1, 2)
// => 1157
```

## 4. Cap a discount

Staff keep typing in wild discounts. The shop never gives away more than 50 percent.

Define the `cappedDiscount` function, which takes a percentage and returns it limited to at most 50. Use the standard library's `std.math.clamp` rather than writing the comparison yourself.

```zig
cappedDiscount(80)
// => 50
```
