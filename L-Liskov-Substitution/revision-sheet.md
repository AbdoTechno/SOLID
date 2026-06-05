# Revision Sheet - Liskov Substitution Principle (LSP)

Quick revision guide for the Liskov Substitution Principle (LSP), designed for fast recall of core concepts:

---

## Core Definition

Subtypes must be substitutable for their base types in any part of the program without altering the desirable properties of the program or throwing runtime exceptions that violate system stability.

---

## One-Line Summary

> **"Subclasses must fully honor the behavior and promises of their parent classes without causing runtime errors."**

---

## Key Benefits

1. **Predictable Code**: Code is reliable and behaves consistently at runtime.
2. **True Polymorphism**: Uses dynamic dispatch safely without programmatic patches.
3. **Crash Prevention**: Eliminates runtime crashes caused by invoking unsupported methods.
4. **Easier Maintenance**: Derived classes can be modified independently if they respect the parent's contract.

---

## Red Flags

* Subclass methods throwing exceptions like `throw UnimplementedError()` to disable inherited features.
* Cluttering client code with type checking conditions like `if (object is Subtype)` to bypass certain method calls.
* Subclasses mutating state in ways that break the logical or mathematical invariants of the parent class (e.g., the Square-Rectangle problem).
* Subclasses overriding inherited methods as empty blocks when the base class requires a return value or side effect.

---

## Technical Interview Tips

* **Key Terminology**: Focus on "Behavioral Subtyping", "Pre-conditions & Post-conditions", and "LSP Invariants".
* **The Go-To Example**: Describe the `AuditorStudent` that shouldn't apply for scholarships, and show how the `ScholarshipCandidate` interface acts as an intermediate class to keep types safe.
* **The Duck Test**: Recall the "Duck Test" rule to explain how to verify if an inheritance design is correct.