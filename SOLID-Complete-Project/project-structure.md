# Project Directory and File Structure

This document outlines the organization and responsibilities of the files within the simplified integrated project.

---

## Directory Tree

```text
SOLID-Complete-Project/
├── README.md                 # Project guide and overview.
├── explanation.md            # Explanation of how the five SOLID principles are applied in the code.
├── architecture.md           # Architecture diagrams and class relationships in ASCII.
├── project-structure.md      # This file (mapping out project files and folders).
└── source-code/              # The actual Dart source code files.
    ├── interfaces.dart       # Storage abstractions and contracts (DIP).
    ├── models.dart           # Student and course domain models (LSP & ISP).
    ├── repositories.dart     # In-memory storage infrastructure (DIP).
    ├── services.dart         # Core services for registration, enrollment, and grading (SRP).
    └── main.dart             # Application entry point, orchestrating components via DI.
```

---

## File Responsibilities

1. **`interfaces.dart`**:
   - Defines the abstract `StudentRepository` interface for database operations.
   - **Purpose**: Provides the abstraction contract to decouple business logic from infrastructure/database implementations.

2. **`models.dart`**:
   - Contains the `Course` class.
   - Defines the `Gradable` interface for students eligible to receive grades.
   - Contains the base `BaseStudent` class.
   - Contains the subclass implementations: `CreditStudent` and `AuditStudent`.
   - **Purpose**: Represents domain entities, enforces correct inheritance constraints, and organizes grading capability without causing runtime exceptions.

3. **`repositories.dart`**:
   - Implements the `InMemoryStudentRepository` subclass that implements `StudentRepository` using an in-memory data store.
   - **Purpose**: Mocks database persistence with minimal boilerplate code to demonstrate the Dependency Inversion Principle.

4. **`services.dart`**:
   - Contains the `StudentRegistry` class for registering new students.
   - Contains the `EnrollmentManager` class for managing course enrollments.
   - Contains the `GradeBook` class for recording course grades.
   - **Purpose**: House core business logic, divided into dedicated services conforming to the Single Responsibility Principle (SRP).

5. **`main.dart`**:
   - Instantiates the required repositories and services.
   - Links the components together using manual Dependency Injection (DI) through class constructors.
   - Simulates end-to-end workflows: registering credit/audit students, enrolling them in courses, and recording grades.
   - **Purpose**: Serves as the application's runtime entry point, demonstrating how all five SOLID principles work together cohesively.