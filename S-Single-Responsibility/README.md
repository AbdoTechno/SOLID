# Single Responsibility Principle (SRP)

The Single Responsibility Principle (SRP) is the foundation of writing clean, maintainable code in software engineering.

---

## What is SRP?

The Single Responsibility Principle states: **"A class or module should have one, and only one, reason to change."**

In other words, a class should not perform multiple, unrelated tasks at the same time (like a Swiss Army knife). Instead, it should specialize in executing one specific function correctly and completely.

---

## Why it Exists?

In the early stages of software development, developers sometimes gather multiple functions inside a single, large class (known as a "God Class") for convenience. However, as the system grows and requirements change, these bloated classes become a major obstacle. Modifying a small part (like the fee calculation method) can cause unexpected errors in an unrelated part (like user profile processing) due to tight coupling within the same class.

---

## Problems it Solves

1. **Tight Coupling**: Prevents code components from overlapping in ways that make changing one part break others.
2. **Hard to Test**: When a class is limited to one function, writing unit tests becomes simpler, more effective, and more reliable.
3. **Merge Conflicts**: Reduces merge conflicts when multiple developers work on the codebase, because responsibilities are divided into independent, smaller files.

---

## Benefits

* **Readability**: Makes it easy to understand the purpose of a class just by looking at its name and structure.
* **Reusability**: Specialized classes can be reused across different parts of the application without initializing unnecessary code.
* **Maintainability**: Ensures that requirements can be safely changed without worrying about breaking other parts of the system.

---

## Drawbacks if Ignored

* **Spaghetti Code**: Hard-to-read, tangled logic with multiple responsibilities.
* **Fear of Refactoring**: Refactoring becomes dangerous because any change might break dependent, unrelated features.
* **Rigidity**: Adding new features requires wading through massive classes with thousands of lines of code.

---

## Relation to other SOLID Principles

* **Open-Closed Principle (OCP)**: Dividing responsibilities into small classes makes it easier to extend the system by adding new classes without changing existing code.
* **Interface Segregation Principle (ISP)**: SRP and ISP complement each other. SRP focuses on classes, while ISP focuses on interfaces to avoid forcing classes to implement methods they do not need.