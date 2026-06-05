// Data models and domain entities (Models & Domain Entities)
// Implements LSP and ISP in organizing student attributes and course records

// 1. Course class
class Course {
  final String code;
  final String name;

  Course({required this.code, required this.name});
}

// 2. Grading Interface (ISP): Only implemented by students eligible for exams and grades
abstract class Gradable {
  void addGrade(Course course, String grade);
  Map<Course, String> getGrades();
}

// 3. Base Student Class
abstract class BaseStudent {
  final String id;
  final String name;
  final List<Course> enrolledCourses = [];

  BaseStudent({required this.id, required this.name});

  void enroll(Course course) {
    if (enrolledCourses.any((c) => c.code == course.code)) {
      print('Warning: Student $name is already enrolled in course ${course.name}');
      return;
    }
    enrolledCourses.add(course);
    print('Student $name enrolled in course ${course.name} successfully.');
  }
}

// 4. Credit Student: A regular student who takes exams and gets grades (LSP & ISP Compliant)
class CreditStudent extends BaseStudent implements Gradable {
  final Map<Course, String> _grades = {};

  CreditStudent({required String id, required String name})
      : super(id: id, name: name);

  @override
  void addGrade(Course course, String grade) {
    if (!enrolledCourses.contains(course)) {
      print('Error: Cannot assign grade for course ${course.name} because student $name is not enrolled in it!');
      return;
    }
    _grades[course] = grade;
    print('Grade ($grade) recorded for student $name in course ${course.name}.');
  }

  @override
  Map<Course, String> getGrades() => Map.unmodifiable(_grades);
}

// 5. Audit Student: Attends the course but is not eligible for grades (LSP Compliant)
class AuditStudent extends BaseStudent {
  AuditStudent({required String id, required String name})
      : super(id: id, name: name);
}
