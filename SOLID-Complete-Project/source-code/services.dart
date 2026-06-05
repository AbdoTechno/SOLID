// Business Logic Services (Services/Business Logic Layer)
// Implements SRP by separating student registration, course enrollment, and grading services

import 'interfaces.dart';
import 'models.dart';

// 1. Student Registration Service (SRP): Only responsible for registering a student in storage
class StudentRegistry {
  final StudentRepository _repository;

  StudentRegistry(this._repository);

  void registerStudent(BaseStudent student) {
    print('\n[Registry] Registering new student: ${student.name}...');
    _repository.save(student);
    print('[Registry] Student ${student.name} registered successfully.');
  }
}

// 2. Course Enrollment Service (SRP): Only responsible for enrolling students in courses
class EnrollmentManager {
  void enrollStudentInCourse(BaseStudent student, Course course) {
    print('\n[Enrollment] Attempting to enroll student ${student.name} in course ${course.name}...');
    student.enroll(course);
  }
}

// 3. GradeBook Service (SRP & LSP & ISP): Responsible for assigning grades to eligible students (Gradable)
class GradeBook {
  void assignGrade(BaseStudent student, Course course, String grade) {
    print('\n[GradeBook] Attempting to record grade for student ${student.name} in course ${course.name}...');
    
    // LSP Compliance Check: If student implements Gradable, record the grade. Otherwise, skip safely.
    if (student is Gradable) {
      (student as Gradable).addGrade(course, grade);
    } else {
      print('Security Alert (LSP): Student ${student.name} is an auditor (AuditStudent). Cannot assign grades to audit students in this system.');
    }
  }
}
