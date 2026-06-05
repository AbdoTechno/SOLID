# Integrated Simplified University Management System

This directory contains a simplified practical application of a university student affairs system using minimal source code. The project is not intended to build a complex software system, but rather to present a highly readable, straightforward demonstration of how all five SOLID principles work together cohesively.

---

## Core Features

1. **Student Registration**: Saving new student profiles to a storage repository.
2. **Course Enrollment**: Enabling students to register for academic courses.
3. **Grade Management**: Recording grades for students in their registered courses, while applying constraints that prevent grading audit students (complying with the Liskov Substitution Principle).

---

## Directory Structure

* **[explanation.md](explanation.md)**: Detailed breakdown highlighting exactly where each of the five SOLID principles is applied in the source code.
* **[architecture.md](architecture.md)**: Structural diagrams showing class relationships and dependency flows.
* **[project-structure.md](project-structure.md)**: Detailed mapping of the source code files.
* **`source-code/`**: The actual Dart implementation files:
  - [interfaces.dart](source-code/interfaces.dart): Decoupling contracts and abstractions (such as `StudentRepository`).
  - [models.dart](source-code/models.dart): Domain models for students (such as `CreditStudent` and `AuditStudent`).
  - [repositories.dart](source-code/repositories.dart): In-memory data persistence implementations.
  - [services.dart](source-code/services.dart): Core business logic services.
  - [main.dart](source-code/main.dart): Initialization, dependency injection, and execution flows.

---

## How to Run the Project

To execute the code and examine the output, open your terminal in the root directory of this repository and run the following command:

```bash
dart run SOLID-Complete-Project/source-code/main.dart
```

This will run the execution flows and display clean log messages in the console.