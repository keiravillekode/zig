# Contributions for Exercism Zig Track

We 💙 our community but **this repository does not accept unsolicited pull requests at this time**.

Please read this [community blog post][guidelines] for details.

## How to contribute

1. Open a topic [in the forum][zig-forum] — for bug reports, feature ideas, or questions about the track, including anything you'd otherwise file as an issue.
1. Discuss the proposal with the maintainers.
1. Once you have a go-ahead, submit a pull request that adheres to [Exercism's style guide][style].

If the PR touches an existing exercise, please also consider [this warning][unnecessary-test-runs] in the documentation for [building tracks][building-tracks].

## Running Tests

Exercises can be tested against the locally installed Zig compiler using

```bash
bin/run-tests
```

Exercises can be tested against the test runner using

```bash
bin/verify-exercises-in-docker
```

## The syllabus

The track has a syllabus of Concept Exercises alongside its Practice Exercises. Two rules are specific to this track, and both are enforced in CI by `bin/prereq-check` and `bin/sync-introductions --check`:

- **A Concept Exercise teaches exactly one concept.** That is what lets an exercise's `.docs/introduction.md` be a byte-identical copy of its concept's `introduction.md`. Never edit the copy; edit `concepts/<slug>/introduction.md` and run `bin/sync-introductions`.
- **`config.json` is in teaching order.** Every concept is taught before any exercise that lists it as a prerequisite, and the top-level `concepts` array agrees with the order of `exercises.concept`.

Two further conventions matter because of how the test runner reports results:

- **A Concept Exercise's stub must compile.** Students are shown per-task results, and a stub that fails to build produces a single top-level error with no per-test results at all — so a stub returns a placeholder value rather than using `@compileError`, which is the convention for Practice Exercises.
- **Every test carries a `// task_id = N` comment** naming the task in `instructions.md` it belongs to. The test runner reads these and links each result to its task.

Scaffold a new one with:

```bash
bin/add-exercise -c <concept-slug> <exercise-slug>
```

and check the syllabus with:

```bash
bin/prereq-check
bin/sync-introductions --check
```

[guidelines]: https://exercism.org/blog/contribution-guidelines-nov-2023
[zig-forum]: https://forum.exercism.org/c/programming/zig/199
[building-tracks]: https://exercism.org/docs/building/tracks
[style]: https://exercism.org/docs/building/markdown/style-guide
[unnecessary-test-runs]: https://exercism.org/docs/building/tracks#h-avoiding-triggering-unnecessary-test-runs
