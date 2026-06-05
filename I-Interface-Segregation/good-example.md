# Compliant Design Explanation (Good Design)

In [good.dart](code/good.dart), we resolved the bloated interface problems by applying the Interface Segregation Principle (ISP):

---

## New Solution Structure

We broke down the bloated `UniversityMember` interface into four small, highly specialized interfaces:
1. **`ClassAttendee`**: Declares only the `attendClass()` method.
2. **`AssignmentSubmitter`**: Declares only the `submitAssignment()` method.
3. **`CourseInstructor`**: Declares `teachCourse()` and `gradeExams()` methods.
4. **`SalariedEmployee`**: Declares only the `calculateSalary()` method.

Subsequently, domain classes implement only the specific interfaces that map directly to their roles:
- The `Student` class implements: `ClassAttendee, AssignmentSubmitter`.
- The `Teacher` class implements: `ClassAttendee, CourseInstructor, SalariedEmployee`.

---

## Acquired Architectural Benefits

* **Zero Dead Code**:
   Inspecting the `Student` and `Teacher` classes reveals that all implemented methods contain active, relevant operations. No mock overrides, empty scopes, or `UnimplementedError()` exceptions exist, making the codebase highly readable and maintainable.

* **Interface Composition**:
   If a new role is introduced to the university, such as a Teaching Assistant (TA)—a graduate student who attends classes and submits assignments, but also teaches freshman labs and receives a salary—we can easily compose their behavior:
   ```dart
   class TeachingAssistant implements ClassAttendee, AssignmentSubmitter, CourseInstructor, SalariedEmployee {
     // Implement the methods safely according to their actual roles
   }
   ```
   This approach allows us to assemble behaviors like building blocks to meet changing requirements.

* **Decoupled Updates (Closed to Change Propagation)**:
   If salary calculation rules change, we only modify the `SalariedEmployee` interface and its implementing classes (like `Teacher` or `Staff`). The `Student` class is completely shielded from these changes and does not require recompilation or code reviews.