# Instructions

You are running the lost property office at a railway station. Most things that arrive have no owner recorded, so almost every field in the ledger might be missing — and the type system is going to make you say so.

## 1. Give an owner or say unknown

Every item has an owner's membership number, or does not.

Define the `ownerOrUnknown` function, which takes an optional membership number and returns it, or `0` when there is none.

```zig
ownerOrUnknown(null)
// => 0
```

## 2. Say whether an item has been claimed

Define the `isClaimed` function, which takes an optional membership number and returns whether there is one.

```zig
isClaimed(17)
// => true
```

## 3. Look an item up in the ledger

Define the `find` function, which takes a list of item codes and the code you are looking for, and returns the position of the first match, or `null` if the code is not there.

```zig
find(&[_]u32{ 40, 41, 42 }, 41)
// => 1
```

## 4. Work out the storage fee

Items are stored free for the first week. After that they cost 50 pence a day, counting only the days beyond the seventh. An item whose arrival date was never recorded is free.

Define the `feeFor` function, which takes an optional number of days in storage and returns the fee in pence.

```zig
feeFor(10)
// => 150
```
