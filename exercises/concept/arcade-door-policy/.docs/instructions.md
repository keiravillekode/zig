# Instructions

You have been put on the door at the arcade. The rules are fiddly and the queue is long, so you are going to encode the door policy instead of memorising it.

Every function here takes some `bool` arguments and returns a `bool`. Don't worry about where the arguments come from — just combine them.

## 1. Decide who may come in

Someone may come in if they have bought a ticket, or if they are a member.

Define the `canEnter` function, which takes whether the person has a ticket and whether they are a member.

```zig
canEnter(false, true)
// => true
```

## 2. Decide who pays a deposit

Ticket holders who are not members have to leave a deposit for their token cup. Members never do.

Define the `mustPayDeposit` function, which takes whether the person has a ticket and whether they are a member.

```zig
mustPayDeposit(true, false)
// => true
```

## 3. Decide who is barred

Someone who caused trouble last time is barred, unless they appealed and the appeal was upheld.

Define the `isBarred` function, which takes whether the person caused trouble and whether their appeal was upheld.

```zig
isBarred(true, false)
// => true
```

## 4. Decide who gets a free go

A member gets a free go on their birthday, as long as they are not barred.

Define the `getsFreeGo` function, which takes whether the person is a member, whether it is their birthday, whether they caused trouble and whether their appeal was upheld. Reuse the function you wrote in task 3 rather than working out "barred" a second time.

```zig
getsFreeGo(true, true, false, false)
// => true
```
