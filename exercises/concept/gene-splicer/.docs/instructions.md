# Instructions

You are writing the control software for a gene splicer. DNA is made of four bases, written `'A'`, `'C'`, `'G'` and `'T'`, and every one of these tasks is a lookup from a base to something else — exactly what `switch` is for.

Anything that is not one of the four bases is contamination, and every function has to cope with it.

## 1. Complement a base

The two strands of DNA pair up: `'A'` with `'T'` and `'C'` with `'G'`, in both directions.

Define the `complement` function, which takes a base and returns the base it pairs with. Contamination is passed through unchanged.

```zig
complement('A')
// => 'T'
```

## 2. Identify the purines

`'A'` and `'G'` are purines. `'C'` and `'T'` are not, and neither is contamination.

Define the `isPurine` function, which takes a base and returns whether it is a purine. Put both purines in a single case.

```zig
isPurine('G')
// => true
```

## 3. Count the hydrogen bonds

An `'A'`–`'T'` pair is held together by 2 hydrogen bonds and a `'C'`–`'G'` pair by 3.

Define the `bondCount` function, which takes a base and returns how many bonds its pair has. Contamination has none.

```zig
bondCount('C')
// => 3
```

## 4. Band a quality score

The sequencer scores each reading from 0 to 100. The lab groups them into bands:

- 0 to 19 is band 1
- 20 to 49 is band 2
- 50 to 79 is band 3
- 80 and above is band 4

Define the `qualityBand` function, which takes a score and returns its band. Use ranges rather than a chain of comparisons.

```zig
qualityBand(55)
// => 3
```
