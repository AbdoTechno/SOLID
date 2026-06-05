// System interfaces and dependency contracts (Interfaces & Abstractions)
// Implements the Dependency Inversion Principle (DIP) in the project

import 'models.dart';

// 1. Storage Contract (DIP): The system depends on this interface rather than a concrete repository implementation
abstract class StudentRepository {
  void save(BaseStudent student);
  BaseStudent? findById(String id);
  List<BaseStudent> getAll();
}
