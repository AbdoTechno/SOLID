# Compliant Design Explanation (Good Design)

In [good.dart](code/good.dart), we restructured the inheritance hierarchy and aligned responsibilities as follows:

---

## New Solution Structure

1. **Common Behavior in Base Class (`Student`)**:
   Since all students study and attend lectures, we limited the base class `Student` to common behaviors, primarily the abstract `study()` method.

2. **Specialized Class for Scholarship Candidates (`ScholarshipCandidate`)**:
   We introduced a specialized abstract class named `ScholarshipCandidate` that extends `Student`. This class holds the `applyForScholarship()` method contract, which is only relevant to students eligible for scholarships.

3. **Restructuring the Inheritance Relationships**:
   - `RegularStudent` extends the intermediate `ScholarshipCandidate` class (because they study and qualify for scholarships).
   - `AuditorStudent` extends the base `Student` class directly (because they only study and do not qualify for scholarships).

---

## Acquired Architectural Benefits

* **Compile-Time Type Safety**:
   The routine responsible for processing scholarship applications now strictly requires a list of `ScholarshipCandidate` objects:
   ```dart
   void processScholarshipApplications(List<ScholarshipCandidate> candidates) { ... }
   ```
   Thanks to this restriction, the Dart compiler prevents developers from passing an `AuditorStudent` instance to this method. Potential runtime bugs are caught and resolved during development.

* **Full Compliance with LSP**:
   Now, any subclass deriving from `Student` (whether regular or auditing) can substitute for the parent class `Student` in any context requesting the common `study()` method, without throwing exceptions or breaking client expectations.

* **No More Type Checks**:
   We completely eliminated conditional patches like `if (student is AuditorStudent)`. The codebase leverages polymorphism cleanly and conforms to modern architectural standards.