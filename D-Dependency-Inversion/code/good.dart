// Compliant code adhering to the Dependency Inversion Principle (DIP)
// The business logic class depends on Abstraction, and the database is injected from the outside.

import 'dart:io';

// 1. Abstraction (Interface)
abstract class DatabaseService {
  void saveStudent(String id, String name);
}

// 2. Low-level modules implementing the Abstraction (Concrete Details)
class MySqlDatabase implements DatabaseService {
  @override
  void saveStudent(String id, String name) {
    print('Connecting to MySQL database...');
    sleep(Duration(milliseconds: 400));
    print('Student $name (ID: $id) successfully saved to MySQL Students table.');
  }
}

class MongoDatabase implements DatabaseService {
  @override
  void saveStudent(String id, String name) {
    print('Connecting to MongoDB database (NoSQL)...');
    sleep(Duration(milliseconds: 400));
    print('Student $name (ID: $id) successfully saved as a Document in MongoDB.');
  }
}

// 3. High-level module
// Protected and decoupled: depends on Abstraction, not concrete technology
class StudentEnrollmentSystem {
  // Depends on Abstraction, not Details
  final DatabaseService _databaseService;

  // Dependency is injected from the outside (Dependency Injection)
  StudentEnrollmentSystem(this._databaseService);

  void enrollStudent(String id, String name) {
    print('Starting student enrollment process for $name...');
    // Calls the abstract method
    _databaseService.saveStudent(id, name);
    print('Enrollment process completed successfully.\n');
  }
}

void main() {
  print('--- Running Compliant Code (Good DIP Example) ---');

  // Scenario 1: Using MySQL
  print('=== Scenario: MySQL Database ===');
  final mysqlDb = MySqlDatabase();
  final systemWithMySql = StudentEnrollmentSystem(mysqlDb);
  systemWithMySql.enrollStudent('1001', 'Sameh Abdelaziz');

  print('--------------------------------------------------');

  // Scenario 2: Swapping to MongoDB (done in seconds without modifying StudentEnrollmentSystem!)
  print('=== Scenario: MongoDB Database ===');
  final mongoDb = MongoDatabase();
  final systemWithMongo = StudentEnrollmentSystem(mongoDb);
  systemWithMongo.enrollStudent('1002', 'Marwan El-Shafei');
}
