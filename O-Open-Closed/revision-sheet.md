# Revision Sheet - Open-Closed Principle (OCP)

Quick revision guide for the Open-Closed Principle (OCP), designed for fast recall of core concepts:

---

## Core Definition

Software entities should be **open for extension** (to add new features and behaviors) but **closed for modification** (to protect stable, running code from being tampered with or broken).

---

## One-Line Summary

> **"Add new features by writing new classes that extend the existing system, rather than modifying old, tested code."**

---

## Key Benefits

1. **Protects Stable Code**: Prevents regression bugs when adding new features.
2. **Flexible Extensibility**: Allows the system to scale and adapt to business requirements quickly.
3. **Fewer Merge Conflicts**: Developers write new code in separate files, minimizing overlapping Git edits.
4. **Focused QA Testing**: Testing efforts can target new classes rather than re-evaluating legacy modules.

---

## Red Flags

* Conditional blocks (`if-else`, `switch`) that expand continuously with every new business rule.
* The necessity to open and edit core, stable classes to support a new business entity or type.
* Low testability because classes contain hardcoded, varying conditional paths.
* Frequent runtime type checking (e.g., using `is` in Dart) or type casting to resolve behavior.

---

## Technical Interview Tips

* **Key Terminology**: Use terms like "Abstraction", "Polymorphism", "Dynamic Dispatch", and "Strategy Pattern" to explain how OCP is achieved.
* **The Go-To Example**: Explain the student discount calculator (Regular, VIP, Scholarship) and how the `DiscountStrategy` interface decouples the calculator from individual student details.
* **Architecture Balance**: Emphasize that OCP is applied strategically in areas of predicted change (YAGNI), rather than everywhere, to avoid excessive abstract configurations (Over-engineering).