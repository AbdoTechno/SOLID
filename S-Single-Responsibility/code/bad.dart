// Non-compliant code violating the Single Responsibility Principle (SRP)
// This class handles multiple responsibilities: holding student data, enrolling in courses, saving to the database, and sending notifications.

import 'dart:io';

class Student {
  final String id;
  final String name;
  final String email;
  final List<String> enrolledCourses = [];

  Student({required this.id, required this.name, required this.email});

  // 1. Responsibility: Course management
  void enrollInCourse(String courseName) {
    enrolledCourses.add(courseName);
    print('Student $name enrolled in course: $courseName');
  }

  // 2. Responsibility: Database persistence
  void saveToDatabase() {
    print('Connecting to the database...');
    // Simulate database write delay
    sleep(Duration(milliseconds: 500));
    print('Student $name successfully saved to Students table.');
  }

  // 3. Responsibility: Notifications
  void sendWelcomeEmail() {
    print('Sending welcome email to $email...');
    // Simulate email sending delay
    sleep(Duration(milliseconds: 500));
    print('Email successfully sent: "Welcome $name to our college!"');
  }
}

void main() {
  print('--- Running Non-compliant Code (Bad SRP Example) ---');
  final student = Student(id: '101', name: 'Ahmed Mahrous', email: 'ahmed@example.com');
  
  student.enrollInCourse('Computer Science 101');
  student.saveToDatabase();
  student.sendWelcomeEmail();
}
