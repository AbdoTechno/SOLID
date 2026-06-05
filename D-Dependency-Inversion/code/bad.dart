// كود عك بيخالف مبدأ الـ DIP
// كلاس البيزنس الرئيسي ملحوم مباشرة في كلاس قاعدة البيانات الـ MySQL!

import 'dart:io';

// 1. موديول منخفض المستوى (Low-level module)
class MySqlDatabase {
  void saveStudentData(String id, String name) {
    print('جاري الاتصال بقاعدة بيانات MySQL...');
    sleep(Duration(milliseconds: 500));
    print('تم حفظ الطالب $name (ID: $id) بنجاح في جدول MySQL Students.');
  }
}

// 2. موديول عالي المستوى (High-level module)
class StudentEnrollmentSystem {
  // كسر مبدأ الـ DIP! معتمدين مباشرة على الكلاس المادي MySQL
  late final MySqlDatabase _database;

  StudentEnrollmentSystem() {
    // الكلاس هو اللي بينشئ الاعتمادية بتاعته بنفسه جوة الكونسركتور!
    _database = MySqlDatabase();
  }

  void enrollStudent(String id, String name) {
    print('بدء عملية تسجيل الطالب $name في السيستم...');
    // لوجيك تسجيل وتأكيد
    _database.saveStudentData(id, name);
    print('عملية التسجيل تمت بالكامل بنجاح.\n');
  }
}

void main() {
  print('--- تشغيل كود التسجيل العك (Bad DIP Example) ---');
  
  final enrollmentSystem = StudentEnrollmentSystem();
  enrollmentSystem.enrollStudent('2001', 'سامح عبد العزيز');
}
