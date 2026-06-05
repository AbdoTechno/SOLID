# Non-compliant Design Explanation (Bad Design)

In [bad.dart](code/bad.dart), the example illustrates the architectural issues caused by designing bloated, monolithic interfaces:

---

## Core Problem Analysis

We created a single abstract interface named `UniversityMember` containing all university actions and roles:
```dart
abstract class UniversityMember {
  void attendClass();
  void submitAssignment();
  void teachCourse();
  void gradeExams();
  void calculateSalary();
}
```

The design flaw here is that no single member of a university performs all of these actions:
- A student attends classes and submits assignments, but they do not teach courses, grade exams, or receive monthly salaries.
- A teacher teaches courses, grades exams, and receives a salary, but they do not submit student assignments.

By forcing both `Student` and `Teacher` classes to implement this comprehensive interface, the developer is forced to write empty method bodies or throw exceptions such as `throw UnimplementedError()` to bypass unsupported operations.

---

## Maintenance Issues

1. **Runtime Crashes**:
   If client code attempts to invoke `teachCourse()` on a `Student` reference—relying on the fact that the method is declared in the common `UniversityMember` interface—the application will crash at runtime since the student instance throws a not-implemented error.

2. **Bloated Code (Dummy Implementations)**:
   The codebase is littered with unused, empty methods, reducing code readability and making it difficult for new developers to track actual object responsibilities.

3. **Rigid Propagation of Changes**:
   If the university decides to introduce a new action to the `UniversityMember` interface, such as `scanFingerprintAtGate()` (for biometric gate access), we are forced to open and modify the `Student` class, `Teacher` class, and any other implementing classes to add the method signature, even if students are exempt from scanning. This structure increases compile-time dependencies and risks breaking stable parts of the code.