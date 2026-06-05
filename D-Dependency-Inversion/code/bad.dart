// Non-compliant code violating the Dependency Inversion Principle (DIP)
// The main business logic class is tightly coupled to the specific MySqlDatabase class!

import 'dart:io';

// 1. Low-level module
class MySqlDatabase {
  void saveStudentData(String id, String name) {
    print('Connecting to MySQL database...');
    sleep(Duration(milliseconds: 500));
    print('Student $name (ID: $id) successfully saved to MySQL Students table.');
  }
}

// 2. High-level module
class StudentEnrollmentSystem {
  // Violates DIP! Directly depending on the concrete class MySqlDatabase.
  late final MySqlDatabase _database;

  StudentEnrollmentSystem() {
    // The class instantiates its own dependency inside the constructor!
    _database = MySqlDatabase();
  }

  void enrollStudent(String id, String name) {
    print('Starting student enrollment process for $name...');
    // Enrollment logic
    _database.saveStudentData(id, name);
    print('Enrollment process completed successfully.\n');
  }
}

void main() {
  print('--- Running Non-compliant Code (Bad DIP Example) ---');
  final system = StudentEnrollmentSystem();
  system.enrollStudent('1001', 'Sameh Abdelaziz');
}
