# Interface Segregation Principle (ISP)

The Interface Segregation Principle (ISP) is the fourth of the SOLID principles. It aims to design lean, highly specialized interfaces to protect classes from bloating with unused and irrelevant methods.

---

## What is ISP?

The Interface Segregation Principle states: **"Clients should not be forced to depend upon interfaces that they do not use."**

In other words, instead of designing a single, massive interface containing a large number of method signatures and forcing all implementing classes to provide concrete definitions for all of them, OCP directs us to divide the interface into smaller, specialized interfaces. This allows each class to implement only the interface contracts relevant to its actual business needs.

---

## Why it Exists?

To illustrate the importance of the principle, suppose we designed a single global interface named `UniversityMember` and packed it with all method contracts related to university staff and students: teaching lectures, grading exams, paying tuition fees, security shifts, and kitchen tasks.

When trying to create a `Student` class implementing this interface, the developer is forced to write empty mock definitions or throw runtime exceptions to disable methods like `calculateSalary()` or `gradeExams()`. This bloated design is a massive code smell that hampers the maintainability and scalability of the system.

---

## Problems it Solves

1. **Bloated Interfaces**: Prevents mixing unrelated actions and responsibilities in a single, massive interface.
2. **Dummy Implementations**: Eliminates empty method bodies written solely to satisfy the compiler:
   `void doSomething() { /* No actual operation */ }`
3. **Fragile Recompilations**: In large codebases, modifying a single method signature in a bloated interface forces all classes implementing that interface to recompile and rebuild, even if those classes do not consume the modified method.

---

## Benefits

* **Lean Interfaces**: Guarantees that every class only implements the methods it actually needs to perform its job.
* **Reduced Rebuild Times**: In large projects, decoupling interfaces prevents rebuilding system components that were not affected by the code modification.
* **Better Architectural Composition**: Small interfaces can be combined dynamically (Interface Composition) to meet changing business requirements.

---

## Drawbacks if Ignored

* **Accumulation of Dead Code**: The codebase becomes cluttered with empty, unused methods, confusing developers and reducing code readability.
* **Rigid Maintenance**: Modifying a bloated global interface triggers a chain reaction of forced updates across many unrelated classes in the system.

---

## Relation to other SOLID Principles

* **Single Responsibility Principle (SRP)**: ISP is effectively SRP applied at the interface level. While SRP guides us to limit a class's responsibility, ISP guides us to limit the scope of interfaces.
* **Liskov Substitution Principle (LSP)**: Adhering to ISP ensures subclasses are not forced to disable unsupported parent behaviors by throwing exceptions, maintaining full compliance with LSP.