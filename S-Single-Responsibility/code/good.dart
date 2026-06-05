// Compliant code adhering to the Single Responsibility Principle (SRP)
// Each class here has a single responsibility and only one reason to change.

import 'dart:io';

// 1. Student class: Only responsible for holding student data and their enrolled courses
class Student {
  final String id;
  final String name;
  final String email;
  final List<String> enrolledCourses = [];

  Student({required this.id, required this.name, required this.email});

  void enrollInCourse(String courseName) {
    enrolledCourses.add(courseName);
    print('Student $name enrolled in course: $courseName');
  }
}

// 2. StudentRepository class: Only responsible for persistence/database operations
class StudentRepository {
  void saveToDatabase(Student student) {
    print('Connecting to the database...');
    // Simulate database write delay
    sleep(Duration(milliseconds: 500));
    print('Student ${student.name} successfully saved to Students table.');
  }
}

// 3. EmailService class: Only responsible for sending notifications
class EmailService {
  void sendWelcomeEmail(Student student) {
    print('Sending welcome email to ${student.email}...');
    // Simulate email sending delay
    sleep(Duration(milliseconds: 500));
    print('Email successfully sent: "Welcome ${student.name} to our college!"');
  }
}

void main() {
  print('--- Running Compliant Code (Good SRP Example) ---');
  
  // 1. Create student
  final student = Student(id: '101', name: 'Ahmed Mahrous', email: 'ahmed@example.com');
  student.enrollInCourse('Computer Science 101');
  
  // 2. Save student using the dedicated repository
  final repo = StudentRepository();
  repo.saveToDatabase(student);
  
  // 3. Send welcome email using the dedicated email service
  final emailService = EmailService();
  emailService.sendWelcomeEmail(student);
}
