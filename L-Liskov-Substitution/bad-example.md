# Non-compliant Design Explanation (Bad Design)

In [bad.dart](code/bad.dart), the example illustrates the architectural instability and issues caused by incorrect inheritance:

---

## Core Problem Analysis

We created a parent class named `Student` containing an `applyForScholarship` method.
Subsequently, we created a subclass named `AuditorStudent` (an auditing student attending lectures without grades) that inherits from `Student`.

The problem is that in a university system, an auditor student is not eligible to apply for scholarships; they only attend lectures. However, due to the inheritance relationship, `AuditorStudent` is forced to inherit the `applyForScholarship` method.

To resolve this logically mismatching behavior, the developer overrode the method to throw a runtime exception when invoked:
```dart
throw Exception('Error: Auditor student cannot apply for scholarships...');
```

This design directly violates the **Liskov Substitution Principle (LSP)** because the subclass (`AuditorStudent`) cannot substitute for its parent class (`Student`) without throwing an exception and breaking client code.

---

## Maintenance Issues

1. **Runtime Crashes**:
   When client code processes a collection of students (`List<Student>`) and invokes `applyForScholarship()` on each element—which is expected and safe behavior under the parent's contract—the system crashes the moment the loop encounters an `AuditorStudent` object.

2. **Code Smells and Rigid Patching**:
   To prevent runtime crashes, developers are forced to check the object type manually:
   ```dart
   if (student is! AuditorStudent) {
     student.applyForScholarship();
   }
   ```
   This type check is a classic code smell. It violates OCP because this condition must be modified every time a new student subtype is introduced that does not qualify for scholarships (e.g., visitor students). It proves that the inheritance hierarchy is unreliable.

3. **Misleading Interface Contracts**:
   When other team members see `applyForScholarship` defined in the base `Student` class, they assume it can be invoked safely on any `Student` instance. Unexpected exceptions at runtime destroy trust in the system's architecture and make debugging difficult.