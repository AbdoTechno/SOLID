// واجهات النظام وعقود الاعتمادية (Interfaces & Abstractions)
// بيعبر عن الـ DIP في المشروع

import 'models.dart';

// 1. عقد التخزين (DIP): السيستم بيعتمد على الواجهة دي مش على تطبيق مادي محدد
abstract class StudentRepository {
  void save(BaseStudent student);
  BaseStudent? findById(String id);
  List<BaseStudent> getAll();
}
