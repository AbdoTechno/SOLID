# Revision Sheet - Single Responsibility Principle (SRP)

Quick revision guide for the Single Responsibility Principle (SRP), designed for fast recall of core concepts:

---

## Core Definition

A class or module should have **one, and only one, reason to change**. This means a component should serve only one business actor or satisfy a single functional requirement (Single Actor).

---

## One-Line Summary

> **"Every software component should specialize in a single focused task and perform it completely and correctly."**

---

## Key Benefits

1. **High Readability**: Code is easy to scan and understand.
2. **Simplified Testability**: Unit testing can isolate features without complex mocking.
3. **Reusability**: Smaller, specialized classes can be reused across different layers.
4. **Safe Maintainability**: Updates are localized and do not cause regressions in unrelated modules.

---

## Red Flags

* A class file exceeding **500 lines** of code without architectural reason.
* A class handling unrelated tasks (e.g., calculating pay rates AND generating PDF reports).
* Low Cohesion: methods inside the class using different, non-overlapping subsets of class fields.
* A large number of diverse imports in a single file.
* Using the word "and" repeatedly when explaining what a class does.

---

## Technical Interview Tips

* **The Go-To Example**: Describe the `Invoice` class that calculates balances, prints PDFs, and sends emails, and show how to split it into three decoupled, specialized classes.
* **Key Terminology**: Use terms like "Reason to change", "High Cohesion", "Loose Coupling", and "Domain boundaries" to demonstrate deep design understanding.
* **Pragmatism**: Emphasize the importance of finding a balance to avoid over-engineering (excessive fragmentation of files), keeping simple CRUD screens straightforward.