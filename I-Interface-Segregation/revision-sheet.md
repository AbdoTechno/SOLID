# Quick Revision Sheet for Interface Segregation Principle (ISP)

A quick guide for the Interface Segregation Principle (ISP), designed for fast recall of core concepts:

---

## Core Definition

No class should be forced to depend on or implement interfaces or methods that it does not use. This is achieved by splitting large, bloated interfaces into smaller, more specific ones.

---

## One-Line Summary

> **"Interfaces should not force classes to implement methods they do not need."**

---

## Benefits

1. **Clean and Lean Code**: Completely free of dead or stubbed methods.
2. **Reduced Coupling**: Complete isolation of behavior, leading to loose coupling.
3. **Easier Mocking**: Simpler simulation of dependencies during unit testing.
4. **High Flexibility**: Better composition of interfaces to build complex, role-based behaviors.

---

## Red Flags (Violations)

* The presence of methods throwing `UnimplementedError()` or similar exceptions.
* Empty methods implemented solely to satisfy compiler/interface requirements.
* A single interface containing methods serving unrelated responsibilities (e.g., storage and display in the same interface).
* Modifying a method in an interface causes compilation errors or requires changes in classes that do not use that method.

---

## Technical Interview Tips

* **Key Concepts**: Focus on "Role Interface" vs. "Fat/Bloated Interface".
* **Standard Example**: The University Member example, showing how it is split into specialized interfaces like `ClassAttendee`, `CourseInstructor`, and `SalariedEmployee`.
* **Relationship to Other Principles**: ISP is essentially the Single Responsibility Principle (SRP) applied to interfaces instead of classes.