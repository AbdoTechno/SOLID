# System Architecture and Class Diagrams

These diagrams illustrate the relationships and dependencies between classes and services in the simplified project, providing an easy-to-understand representation of the system structure.

---

## 1. Domain Hierarchy Diagram

This diagram shows how we separated the `Gradable` interface from the parent student class to satisfy the Liskov Substitution Principle (LSP) and the Interface Segregation Principle (ISP):

```text
                     +----------------------------+
                     |        BaseStudent         | <---------------+
                     |      (abstract class)      |                 |
                     +----------------------------+                 |
                     | - String id                |                 |
                     | - String name              |                 |
                     | - List<Course> enrolledCs  |                 |
                     +----------------------------+                 |
                     | + enroll(Course)           |                 |
                     +-------------+--------------+                 |
                                   ^                                | (extends)
                                   | (extends)                      |
                 +-----------------+-----------------+              |
                 |                                   |              |
    +--------------------------+        +--------------------------+|
    |      CreditStudent       |        |       AuditStudent       ||
    +--------------------------+        +--------------------------+|
    | - Map<Course,Str> grades |        | (Attends courses without ||
    +--------------------------+        |  grades)                 ||
    | + addGrade(Course, Grade)|        +--------------------------+|
    | + getGrades()            |                                    |
    +--------------------------+                                    |
                 |                                                  |
                 v (implements)                                     |
    +--------------------------+                                    |
    |       <<Gradable>>       |                                    |
    |     (Interface/ISP)      |                                    |
    +--------------------------+                                    |
    | + addGrade(Course, Grade)|                                    |
    | + getGrades()            |                                    |
    +--------------------------+                                    |
                                                                    |
                                     +----------------------------+ |
                                     |      ExchangeStudent       | +
                                     | (Future student type model)|
                                     +----------------------------+
```

---

## 2. Dependency Setup Flow

This diagram demonstrates how core business logic classes are isolated from concrete storage components using interfaces and Dependency Injection (DI):

```text
            +-----------------------------------------------+
            |                   main.dart                   |
            |   (Creates objects & injects via constructors)  |
            +-----------------------+-----------------------+
                                    |
            +-----------------------+-----------------------+
            | (Injects Repo)                                | (Calls assignGrade)
            v                                               v
+-----------------------+                       +-----------------------+
|    StudentRegistry    |                       |       GradeBook       |
+-----------+-----------+                       +-----------+-----------+
            |                                               |
            | (Depends on)                                  | (Checks if Gradable)
            v                                               v
+-----------------------+                       +-----------------------+
| <<StudentRepository>> |                       |     <<Gradable>>      |
|      (Interface)      |                       |   (Interface/ISP)     |
+-----------------------+                       +-----------+-----------+
            |                                               ^
            | (Implemented by)                              | (Implemented by)
+-----------------------+                       +-----------+-----------+
|InMemoryStudentRepos.  |                       |     CreditStudent     |
|    (Infrastructure)   |                       +-----------------------+
+-----------------------+
```

---

## 3. Data Flow: Grading Operation

```text
[Execution path in main()] ──(Student, Course, Grade)──> [GradeBook Service]
                                                               │
                                               (Does student implement Gradable?)
                                                               │
                                         ┌─────────────────────┴─────────────────────┐
                                         │ (Yes)                                     │ (No)
                                         v                                           v
                                [Cast to Gradable]                         [Print safety log message]
                               (student.addGrade())                        (Safe exit for audit student)
```

This architecture establishes a flexible, decoupled system, providing a reference for reviewing SOLID design practices.