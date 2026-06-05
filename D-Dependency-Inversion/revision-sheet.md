# Quick Revision Sheet for Dependency Inversion Principle (DIP)

This cheat sheet provides a concise and direct summary of the Dependency Inversion Principle (DIP) for fast recall:

---

## Core Definition

1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
2. Abstractions should not depend on details. Details should depend on abstractions.

---

## One-Line Summary

> **"Decouple components by making them interact through abstract interfaces instead of concrete implementations."**

---

## Key Benefits

1. **High Flexibility**: Swap and upgrade low-level technologies (such as database engines or API services) with minimal effort.
2. **Simplified Testing**: Write isolated unit tests using mocks and stubs instead of real infrastructure.
3. **Loose Coupling**: Reduce interdependencies to prevent cascading errors across the codebase.
4. **Clean Separation of Concerns**: Keep business workflows (domain layer) isolated from infrastructure details (database, UI, networking).

---

## Red Flags (Violations)

* Business logic classes instantiating low-level service classes directly (using `new` or direct constructor invocation).
* High-level constructors accepting concrete classes instead of abstract interfaces.
* The inability to run unit tests without establishing physical database connections or network sockets.
* Modifying a core business logic class when changing notification dispatch mechanisms or API packages.

---

## Technical Interview Tips

* **Core Terminology**: Use phrases like *Abstractions vs. Details*, *Tight/Loose Coupling*, and *Dependency Injection*.
* **Key Distinction**: Clarify that DIP is a design principle (the "what"), while Dependency Injection (DI) is a structural pattern used to achieve it (the "how").
* **Physical Analogy**: Use the wall socket analogy. A light bulb wired directly into the wall is tightly coupled. An outlet provides an abstraction, allowing any bulb to plug in. Translate this to a student registration system and database interface.