# SOLID Principles Application in the Simplified University System

A detailed breakdown highlighting exactly how the five SOLID principles are implemented across the project's source code:

---

## 1. Single Responsibility Principle (SRP)

The Single Responsibility Principle ensures that each class focuses on a single, well-defined responsibility:
* **`StudentRegistry` class**: Responsible solely for registering students and retrieving their records.
* **`EnrollmentManager` class**: Responsible solely for registering students into academic courses.
* **`GradeBook` class**: Responsible solely for assigning and managing student grades.
* **`BaseStudent` class**: Responsible solely for representing core student profile details.
* **`Course` class**: Responsible solely for representing course entity details.

---

## 2. Open-Closed Principle (OCP)

The design allows extending system behaviors without modifying existing, stable classes:
* **Student Types**: If the university introduces a new student type (e.g., `ExchangeStudent` or `ScholarshipStudent`), we simply create a new class extending `BaseStudent`. The services interact with the parent type or relevant interfaces, resolving behavior via Polymorphism without needing internal changes.
* **Data Storage**: The `StudentRegistry` class depends on the abstract `StudentRepository` interface. If we want to switch the storage engine from an in-memory map to a physical database (like SQL or Firestore), we write a new class (e.g., `SqlStudentRepository`) implementing the interface, and inject it during initialization in `main.dart`. The `StudentRegistry` class remains completely unmodified.

---

## 3. Liskov Substitution Principle (LSP)

This principle is demonstrated by separating grading behavior between credit students and audit students:
* **The Problem**: An audit student (`AuditStudent`) attends lectures but does not earn grades or sit for exams. If we define the grade assignment methods in the base `BaseStudent` class and then force `AuditStudent` to override them by throwing an exception (e.g., `UnsupportedError`), we violate LSP because the child class cannot substitute the parent class without breaking client expectations.
* **The Solution**: We extract the grading behavior from `BaseStudent` and move it to a dedicated interface named `Gradable`.
  - `CreditStudent` extends `BaseStudent` and implements the `Gradable` interface.
  - `AuditStudent` extends `BaseStudent` but does not implement `Gradable`.
* In the `GradeBook` service, we check for eligibility:
  ```dart
  if (student is Gradable) {
    (student as Gradable).addGrade(course, grade);
  }
  ```
  This pattern maintains runtime safety, ensuring client classes do not invoke invalid grading workflows on audit student records, and avoids forcing `AuditStudent` to implement operations that conflict with its real-world behavior.

---

## 4. Interface Segregation Principle (ISP)

This principle works in tandem with LSP:
* We created a small, highly cohesive interface `Gradable` in the codebase.
* The `AuditStudent` class is not forced to implement stubbed or empty grading methods since it does not inherit from `Gradable`. Classes implement only the interfaces and methods that directly apply to their role.

---

## 5. Dependency Inversion Principle (DIP)

DIP decouples core business logic services from low-level data storage details:
* The `StudentRegistry` service does not depend on the concrete class `InMemoryStudentRepository`. Instead, it depends on the abstract interface `StudentRepository` defined in [interfaces.dart](source-code/interfaces.dart).
* In [main.dart](source-code/main.dart), we use Dependency Injection (DI) to pass the concrete repository implementation into the constructor of `StudentRegistry` at runtime. This isolates the core domain logic from the technical infrastructure layer.