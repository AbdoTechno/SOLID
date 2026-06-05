# Code Explanation Line-by-Line

A detailed explanation of the compliant software design implemented in [good.dart](code/good.dart):

---

## 1. Abstract Base Class `Student`

```dart
abstract class Student {
  final String name;
  Student(this.name);

  void study();
}
```
- **`Student`**: The unified base class representing common attributes of all students in the university.
- **`study()`**: An abstract method. Since all students are expected to study and attend classes in their own way, we declare this action as a contract that all subclasses inheriting from `Student` must implement.

---

## 2. Scholarship Candidate Abstraction `ScholarshipCandidate`

```dart
abstract class ScholarshipCandidate extends Student {
  ScholarshipCandidate(String name) : super(name);

  void applyForScholarship();
}
```
- **`extends Student`**: An abstract class extending the base class `Student`.
- **`applyForScholarship()`**: An additional method contract designated exclusively for students eligible to apply for scholarships. Isolating this method prevents ineligible student categories from having access to it.

---

## 3. Concrete Subclasses

### Regular Student `RegularStudent`
```dart
class RegularStudent extends ScholarshipCandidate {
  RegularStudent(String name) : super(name);

  @override
  void study() {
    print('$name is studying lectures and completing assignments.');
  }

  @override
  void applyForScholarship() {
    print('$name successfully applied for the scholarship.');
  }
}
```
- Inherits from the intermediate class `ScholarshipCandidate`, thereby receiving both contracts: `study` and `applyForScholarship`.
- Overrides both methods (`@override`) to define their concrete behaviors, without throwing exceptions or disabling inherited behavior.

### Auditor Student `AuditorStudent`
```dart
class AuditorStudent extends Student {
  AuditorStudent(String name) : super(name);

  @override
  void study() {
    print('$name is attending lectures as an auditor, without exams.');
  }
}
```
- Inherits directly from the base `Student` class, thus only receiving the `study()` contract.
- By not inheriting from `ScholarshipCandidate`, it has no access to the scholarship application method, protecting it from having to disable unsupported behaviors or throw exceptions.

---

## 4. Application Processing and the Main Method

```dart
void processScholarshipApplications(List<ScholarshipCandidate> candidates) {
  for (var candidate in candidates) {
    candidate.applyForScholarship();
  }
}
```
- The input parameter type is constrained to `List<ScholarshipCandidate>` rather than a general list of students. This ensures at compile-time that all elements passed into the loop safely support the `applyForScholarship` method and will not crash at runtime.

```dart
  final List<ScholarshipCandidate> scholarshipCandidates = allStudents
      .whereType<ScholarshipCandidate>()
      .toList();
```
- In the main entry point `main()`, we use Dart's `whereType<ScholarshipCandidate>()` utility method to filter the general student list, extracting only the eligible candidates and passing them safely to the processor, in full compliance with the Liskov Substitution Principle.