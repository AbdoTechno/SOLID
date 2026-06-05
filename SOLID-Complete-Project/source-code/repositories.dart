// موديول البنية التحتية للتخزين (Repositories)
// تطبيق عملي للـ DIP وكتابة كود منفصل عن قاعدة البيانات الحقيقية

import 'interfaces.dart';
import 'models.dart';

class InMemoryStudentRepository implements StudentRepository {
  final Map<String, BaseStudent> _storage = {};

  @override
  void save(BaseStudent student) {
    _storage[student.id] = student;
    print('[Repository] تم حفظ بيانات الطالب ${student.name} في المخزن المؤقت.');
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
