"""Shared reading of the track's config.json, for the bin/ scripts."""

import json
from pathlib import Path


class ConceptExercise:
    def __init__(self, index, entry):
        self.index = index
        self.slug = entry["slug"]
        self.name = entry["name"]
        self.uuid = entry["uuid"]
        self.concepts = entry.get("concepts", [])
        self.prerequisites = entry.get("prerequisites", [])
        self.status = entry.get("status", "active")

    @property
    def concept(self):
        """The single concept this exercise teaches.

        The track deliberately keeps a one-to-one mapping between concepts and
        Concept Exercises, so that an exercise's introduction can be a verbatim
        copy of its concept's introduction. `bin/prereq-check` enforces it.
        """
        return self.concepts[0] if self.concepts else None


class PracticeExercise:
    def __init__(self, index, entry):
        self.index = index
        self.slug = entry["slug"]
        self.name = entry["name"]
        self.uuid = entry["uuid"]
        self.practices = entry.get("practices", [])
        self.prerequisites = entry.get("prerequisites", [])
        self.status = entry.get("status", "active")


class Track:
    def __init__(self, root=None):
        self.root = Path(root) if root else Path(__file__).resolve().parent.parent
        self.config = json.loads((self.root / "config.json").read_text(encoding="utf-8"))

        exercises = self.config.get("exercises", {})
        self.concept_exercises = [
            ConceptExercise(i, e) for i, e in enumerate(exercises.get("concept", []))
        ]
        self.practice_exercises = [
            PracticeExercise(i, e) for i, e in enumerate(exercises.get("practice", []))
        ]
        self.concepts = self.config.get("concepts", [])
        self.concept_slugs = [c["slug"] for c in self.concepts]

    @property
    def concept_taught_at(self):
        """Concept slug -> index of the Concept Exercise that teaches it."""
        taught = {}
        for exercise in self.concept_exercises:
            for concept in exercise.concepts:
                taught.setdefault(concept, exercise.index)
        return taught
