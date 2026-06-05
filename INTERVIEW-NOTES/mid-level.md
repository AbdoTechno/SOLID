# Mid-Level Technical Interview Guidelines

Welcome to the Mid-Level technical interview guidelines. At this stage, interviewers shift their focus from theoretical knowledge of SOLID principles to practical application, legacy code refactoring strategies, and resolving architectural design trade-offs.

---

## Connecting SOLID Principles to Design Patterns

Interviewers frequently evaluate your ability to link SOLID principles with common software design patterns:
* **Single Responsibility Principle (SRP) & Repository Pattern**: The Repository pattern is used to isolate data retrieval and persistence logic from the core business models (Domain) and user interfaces (UI), ensuring separation of concerns.
* **Open-Closed Principle (OCP) & Strategy/Factory Patterns**: The Strategy pattern allows switching algorithms (like payment processors or discount calculators) at runtime, while the Factory pattern creates compatible objects without modifying the client code requesting them.
* **Liskov Substitution Principle (LSP) & State Pattern**: Ensures that concrete state classes (subclasses) can replace the base state class cleanly without throwing unexpected runtime exceptions.
* **Interface Segregation Principle (ISP) & Role Interfaces**: We divide broad interfaces into small, role-specific interfaces (such as `Enrollable` and `Payable`) and combine them via class Composition as needed.
* **Dependency Inversion Principle (DIP) & Dependency Injection Frameworks**: We utilize Service Locators or Inversion of Control (IoC) Containers to manage and inject dependencies automatically, increasing application flexibility.

---

## SOLID Principles in Testing & Mocking

A standard interview question asks: How does applying SOLID principles simplify Unit Testing?
* **Without SOLID**: The codebase is tightly coupled. If you try to write a unit test for a service class, it will attempt to open real connections to database engines or make live network requests. This makes tests slow, fragile, and difficult to set up.
* **With SOLID (specifically SRP & DIP)**:
  - The service class receives its dependencies as interfaces via the constructor.
  - During testing, we instantiate lightweight mock classes that implement the same interfaces in memory.
  - We inject these mocks into the service class, enabling us to test its internal logic in complete isolation with high speed and reliability.

---

## Refactoring Legacy Systems

How do you approach refactoring a legacy system that violates SOLID principles but is currently stable in production?
1. **Write Protection Tests First**: Never modify code without a safety net. Write integration or characterization tests to capture the current behavior of the system, establishing a baseline.
2. **Refactor Incrementally**: Avoid full system rewrites (Big Bang Refactoring). Break down changes into small, low-risk steps, refactoring one component at a time.
3. **Isolate Concerns (SRP)**: Extract external infrastructure details (such as databases, email senders, and network clients) into separate, dedicated service classes.
4. **Introduce Abstractions**: Replace direct concrete dependencies with abstract interfaces to transition the codebase toward OCP and DIP.
5. **Run Tests Continuously**: Run your test suite after every small change to catch regressions immediately.

---

## Key Mid-Level Interview Questions

### Q1: What is the difference between Cohesion and Coupling?
**Answer**:
- **Cohesion** measures how closely related the fields and methods within a single class are. We aim for high cohesion (SRP), ensuring a class does one thing well.
- **Coupling** measures the degree of interdependence between different classes. We aim for low/loose coupling (DIP), ensuring that changing one class does not break others.

### Q2: If a `User` entity contains `toJson` and `fromJson` methods, does this violate the Single Responsibility Principle (SRP)?
**Answer**: Technically yes, because serialization/deserialization is a separate concern from the core user domain logic. However, in the context of Data Transfer Objects (DTOs), this is a widely accepted exception to simplify data exchange, provided the serialization logic remains straightforward and does not perform complex validation or IO operations.

### Q3: How does the "Design by Contract" concept support the Liskov Substitution Principle (LSP)?
**Answer**: Design by Contract defines preconditions (what must be true before a method runs) and postconditions (what must be true after a method runs) for class operations. To satisfy LSP, a subclass must not strengthen preconditions (make them stricter) or weaken postconditions (make them looser) defined by the base class. Adhering to these contracts guarantees that client classes can safely substitute subclass instances without unexpected behavior.