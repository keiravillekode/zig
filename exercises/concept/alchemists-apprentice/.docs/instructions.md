# Instructions

You have talked your way into an apprenticeship at a potion shop. The alchemist is tired of counting on her fingers and wants the timings and the pricing worked out in code.

## 1. Define the simmer time

Every batch of potion spends the same 25 minutes bubbling away in the cauldron.

Define the `simmerTimeInMinutes` function, which takes no arguments and returns how long a batch simmers.

```zig
simmerTimeInMinutes()
// => 25
```

## 2. Work out the remaining simmer time

The alchemist keeps wandering off and wants to know how much longer a batch has left.

Define the `remainingSimmerTime` function, which takes the number of minutes a batch has already simmered and returns how many minutes are still to go.

```zig
remainingSimmerTime(10)
// => 15
```

## 3. Work out the grinding time

Every ingredient has to be ground in the mortar before it goes in, and that takes 3 minutes each.

Define the `grindingTimeInMinutes` function, which takes a number of ingredients and returns how many minutes of grinding they need altogether.

```zig
grindingTimeInMinutes(4)
// => 12
```

## 4. Price a bottle

A bottle sells for 12 coins, plus another 4 coins for each ingredient that went into it.

Define the `priceInCoins` function, which takes a number of ingredients and returns the price of the bottle in coins.

```zig
priceInCoins(3)
// => 24
```
