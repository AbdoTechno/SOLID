# Junior Level Technical Interview Guidelines

If you are applying for your first job as a junior software developer or are early in your career, this document provides the core questions, concepts, and guidelines you need to master before your technical interview.

---

## What are the SOLID Principles and Why Do We Use Them?

**SOLID** is an acronym representing five core design principles for object-oriented software, compiled and defined by Robert C. Martin (Uncle Bob).
The primary goals of applying these principles are to write code that is: **clean, flexible, easy to maintain, easy to extend, and resistant to regression bugs when modified**.

1. **S** -> Single Responsibility Principle (SRP)
2. **O** -> Open-Closed Principle (OCP)
3. **L** -> Liskov Substitution Principle (LSP)
4. **I** -> Interface Segregation Principle (ISP)
5. **D** -> Dependency Inversion Principle (DIP)

---

## Frequently Asked Questions & Concise Answers

### Q1: What is the core concept of the Single Responsibility Principle (SRP)?
**Answer**: A class should be responsible for only one specific part of the system's functionality. If a class has multiple reasons to change, it should be split into smaller, focused classes so that modifying one feature does not inadvertently break or impact other features.

### Q2: What is the Open-Closed Principle (OCP) and how do you apply it?
**Answer**: Software entities should be open for extension (adding new functionality) but closed for modification (not changing existing, verified code). It is applied using Abstraction and Polymorphism, allowing you to introduce new subclasses or implementations without modifying existing source code.

### Q3: How do you briefly explain the Liskov Substitution Principle (LSP)?
**Answer**: Subclasses must be completely substitutable for their base classes without altering the correctness of the program. If you subclass a class and are forced to throw an exception (such as `UnsupportedError`) to disable an inherited method, you are violating LSP.

### Q4: What is the Interface Segregation Principle (ISP)?
**Answer**: Clients should not be forced to depend on interfaces or methods they do not use. Instead of creating large, bloated interfaces, split them into smaller, role-specific interfaces so that implementing classes only implement methods relevant to their purpose.

### Q5: What is the difference between the Dependency Inversion Principle (DIP) and Dependency Injection (DI)?
**Answer**: DIP is a high-level design principle advising modules to depend on abstractions rather than concrete classes. DI is a structural design pattern used to implement DIP by passing (injecting) dependencies into a class constructor from the outside, rather than instantiating them internally using the constructor.

---

## Technical Red Flags (Code Smells)

When asked in an interview how to identify code that needs refactoring, watch for the following symptoms:
* **The God Class**: A single class that does almost everything, containing thousands of lines of code and handling multiple responsibilities.
* **Bloated Conditional Blocks**: Long, nested `if-else` or `switch` statements that grow larger every time a new feature is added.
* **Dead/Stubbed Methods**: Subclasses containing empty method bodies or methods that throw `UnimplementedError()` just to satisfy compiler contracts.
* **Direct Service Instantiations**: Extensive use of direct class instantiations for database drivers or network clients inside business logic classes.

---

## Tips for Junior Developers in Interviews

* **Use Simple Analogies**: Instead of relying purely on academic jargon, explain concepts using real-world analogies (like wall outlets or printers) to prove you understand how to apply the concepts practically.
* **Use Correct Technical Terminology**: Frame your answers using established engineering concepts such as *Polymorphism*, *Abstraction*, *Coupling*, *Cohesion*, and *Dependency Injection* to demonstrate professional literacy.
* **Be Clear and Honest**: If you forget a specific acronym or name, focus on explaining the architectural problem and the design solution clearly rather than guessing.