# Technical Interview Questions on the Interface Segregation Principle (ISP)

A collection of technical interview questions and answers regarding the Interface Segregation Principle (ISP), categorized by professional experience level:

---

## Junior Level

### Q1: What is the Interface Segregation Principle (ISP)?
**Answer**: ISP is the fourth principle of SOLID. It states that no class should be forced to implement interfaces or depend on methods it does not use. This is achieved by dividing large, bloated interfaces into smaller, specialized ones.

### Q2: What is the core issue with designing a single unified global interface (Fat Interface)?
**Answer**: Implementing classes are forced to write empty dummy methods or throw exceptions (like `UnimplementedError`) to disable actions that do not fit their purpose, solely to satisfy the compiler. This increases complexity and makes the code fragile.

### Q3: Does ISP focus on classes or on interfaces?
**Answer**: ISP focuses primarily on the design of interfaces, ensuring they are lean, cohesive, and convenient for the client components (consumers) that depend on them.

### Q4: If a subclass method throws an `UnimplementedError` exception, what does it indicate?
**Answer**: This is a direct red flag indicating a violation of both ISP and LSP. The subclass is forced to implement a method signature from a parent contract that it cannot support.

### Q5: How do you fix a bloated interface (Fat Interface)?
**Answer**: By splitting the bloated interface into smaller, specialized interfaces (for example, segregating a massive `Worker` interface into `Workable` and `Feedable`).

### Q6: Does Dart support an explicit `interface` keyword?
**Answer**: No. Unlike languages like Java, Dart does not have an explicit `interface` keyword. Instead, every class implicitly defines an interface. You can implement any class (regular or abstract) as an interface using the `implements` keyword.

### Q7: What is a "Fat" or "Bloated" Interface?
**Answer**: It is an interface that declares a large number of unrelated methods, attempting to serve multiple diverse clients or responsibilities at the same time.

---

## Mid-Level

### Q8: What is the difference between SRP and ISP?
**Answer**:
- **SRP**: Focuses on classes and modules (a class should have only one reason to change).
- **ISP**: Focuses on interfaces and contracts (a client should not be forced to depend on methods it does not consume).
Both principles strive to decrease coupling and increase cohesion, but they operate at different design granularities.

### Q9: How is Interface Composition implemented in Dart?
**Answer**: A class can implement multiple independent interfaces separated by commas: `class TeachingAssistant implements Student, Instructor`. Dart also supports mixins using the `with` keyword to compose shared behaviors dynamically.

### Q10: Doesn't dividing interfaces into smaller pieces increase project complexity?
**Answer**: No. Thoughtful segregation that matches domain roles keeps the codebase decoupled, clean, and testable. The real complexity lies in bloated, heavily coupled interfaces that trigger wide-ranging compile errors when modified.

### Q11: What is the impact of modifying a method signature in a bloated interface?
**Answer**: All classes implementing that interface must be updated and recompiled, even if they never consume the modified method. This increases build times and raises the risk of introducing bugs.

### Q12: How does ISP simplify Mocking during testing?
**Answer**: When interfaces are small and focused, creating mock implementations for unit tests is quick and clean. Developers do not need to write mock declarations for dozens of irrelevant methods.

### Q13: How can you refactor a bloated interface in a large legacy project without breaking existing code?
**Answer**:
First, design the new, segregated interfaces. Then, modify the legacy bloated interface to inherit (`extends`) from the new, smaller interfaces to preserve backward compatibility. Gradually update the client classes to consume the specific smaller interfaces directly, eventually deprecating the monolithic interface.

### Q14: What is the relationship between ISP and the "Client-Specific Interface" concept?
**Answer**: They are the same thing. The principle dictates that interfaces should be designed and structured according to what the client code expects to call, rather than what the implementing class is capable of providing.

---

## Senior Level

### Q15: How does ISP affect Binary Compatibility and shared libraries?
**Answer**: In statically linked and compiled languages (like C++ or Go), violating ISP breaks Binary Compatibility (ABI). In a bloated interface, adding or modifying a method changes the virtual table (vtable) layout, forcing all client applications and shared libraries to recompile. Segregating interfaces shields libraries from unnecessary recompilations.

### Q16: How do you apply ISP to Clean Architecture layer boundaries?
**Answer**: We use ISP at layer boundaries. In the Application/Use Case layer, we split output boundaries (Presenter Interfaces) into small, focused interfaces (e.g., `UserPresenter` and `ErrorPresenter`) rather than designing a single monolithic UI interface. This ensures the UI layer only implements what is necessary for the current presentation scope.

### Q17: Can you apply ISP in dynamically typed languages like JavaScript or Python? Why?
**Answer**: Yes. Although there is no compiler to enforce types, the architectural coupling is still real. If a module exports a massive unified API, client components become tightly coupled to it. This makes refactoring or swapping the module with an alternative highly difficult.

### Q18: Explain the relationship between ISP and Role Interfaces.
**Answer**: Role Interfaces are a design pattern that emerges from applying ISP. Instead of designing interfaces around entity types (Header Interfaces, e.g., representing all things a `Student` can do), we design them around the specific roles an object plays in a given collaboration context (e.g., `ClassAttendee`, `Payer`, `Enrollable`). This provides extreme architectural flexibility.

### Q19: How do you apply ISP when designing Microservices APIs?
**Answer**: We avoid publishing a single, monolithic API that serves all platforms (Web, Mobile, and external clients). Instead, we apply the BFF (Backend For Frontend) pattern to deploy specialized API gateways tailored to each client type, providing only the endpoints and data formats they actually consume.

### Q20: How does ISP intersect with the issue of Interface Pollution in OOP?
**Answer**: Interface Pollution (or over-segregation) occurs when developers over-apply ISP and create an interface for every single method in the system. This floods the codebase with redundant abstractions, hurting readability. A Senior Engineer balances segregation by grouping highly cohesive methods that serve the same client role into a single interface.