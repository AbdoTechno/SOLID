// Main entry point of the integrated university management system
// Demonstrates how all SOLID principles integrate seamlessly using Dependency Injection (DI)

import 'interfaces.dart';
import 'models.dart';
import 'repositories.dart';
import 'services.dart';

void main() {
  print('================================================================');
  print('🏫 Integrated University Management System (SOLID Complete) 🏫');
  print('================================================================');

  // 1. Infrastructure Setup (DIP)
  final StudentRepository studentRepo = InMemoryStudentRepository();

  // 2. Services Initialization (SRP)
  final StudentRegistry registry = StudentRegistry(studentRepo);
  final EnrollmentManager enrollmentManager = EnrollmentManager();
  final GradeBook gradeBook = GradeBook();

  // 3. Define available courses
  final math = Course(code: 'MATH101', name: 'General Mathematics');
  final cs = Course(code: 'CS102', name: 'Introduction to Programming');

  print('\n---------------------------------------------------------');
  print('=== 1. New Student Registration ===');
  
  // Credit Student (Standard student taking exams and getting grades)
  final BaseStudent creditStudent = CreditStudent(
    id: 'CS-2026-001',
    name: 'Hazem Sherif',
  );

  // Audit Student (Student attending classes, not graded)
  final BaseStudent auditStudent = AuditStudent(
    id: 'AU-2026-999',
    name: 'Mostafa Kamel',
  );

  // Register students using the registry service
  registry.registerStudent(creditStudent);
  registry.registerStudent(auditStudent);

  print('\n---------------------------------------------------------');
  print('=== 2. Student Course Enrollment ===');

  // Enroll Hazem in both courses
  enrollmentManager.enrollStudentInCourse(creditStudent, math);
  enrollmentManager.enrollStudentInCourse(creditStudent, cs);

  // Enroll Mostafa (Audit Student) in the programming course only
  enrollmentManager.enrollStudentInCourse(auditStudent, cs);

  print('\n---------------------------------------------------------');
  print('=== 3. Grade Assignments ===');

  // Assign grades to Hazem (Credit Student) - Successful scenario
  gradeBook.assignGrade(creditStudent, math, 'A+');
  gradeBook.assignGrade(creditStudent, cs, 'A');

  // Attempt to assign a grade to Mostafa (Audit Student) - Safe scenario (LSP Compliant)
  // The system rejects the grade assignment gracefully without throwing runtime exceptions or crashing
  gradeBook.assignGrade(auditStudent, cs, 'B+');

  print('\n=========================================================');
  print('🎉 System executed successfully, validating all SOLID principles! 🎉');
  print('=========================================================');
}
