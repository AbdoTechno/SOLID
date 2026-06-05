// Storage Infrastructure Module (Repositories)
// Concrete implementation of StudentRepository for in-memory storage (DIP)

import 'interfaces.dart';
import 'models.dart';

class InMemoryStudentRepository implements StudentRepository {
  final Map<String, BaseStudent> _storage = {};

  @override
  void save(BaseStudent student) {
    _storage[student.id] = student;
    print('[Repository] Student ${student.name} successfully saved to in-memory storage.');
  }

  @override
  BaseStudent? findById(String id) {
    return _storage[id];
  }

  @override
  List<BaseStudent> getAll() {
    return _storage.values.toList();
  }
}
