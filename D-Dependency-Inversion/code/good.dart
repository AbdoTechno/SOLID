// كود نظيف ومتصلح بناءً على مبدأ الـ DIP
// كلاس البيزنس بقى يعتمد على Abstraction والداتا بيز بنحقنها من برة بكل مرونة!

import 'dart:io';

// 1. التجريد (Abstraction - الفيشة القياسية)
abstract class DatabaseService {
  void saveStudent(String id, String name);
}

// 2. موديولات منخفضة المستوى بتنفذ التجريد ده (Concrete Details)
class MySqlDatabase implements DatabaseService {
  @override
  void saveStudent(String id, String name) {
    print('جاري الاتصال بقاعدة بيانات MySQL...');
    sleep(Duration(milliseconds: 400));
    print('تم حفظ الطالب $name (ID: $id) في جدول MySQL Students.');
  }
}

class MongoDatabase implements DatabaseService {
  @override
  void saveStudent(String id, String name) {
    print('جاري الاتصال بقاعدة بيانات MongoDB (NoSQL)...');
    sleep(Duration(milliseconds: 400));
    print('تم حفظ الطالب $name (ID: $id) كـ Document في MongoDB.');
  }
}

// 3. موديول عالي المستوى (High-level module)
// الكلاس ده محمي ونظيف، مش معتمد على تكنولوجيا معينة ومفتوح للتمديد
class StudentEnrollmentSystem {
  // بنعتمد على الـ Abstraction مش الـ Details
  final DatabaseService _databaseService;

  // بنحقن الاعتمادية من برة (Dependency Injection)
  StudentEnrollmentSystem(this._databaseService);

  void enrollStudent(String id, String name) {
    print('بدء عملية تسجيل الطالب $name في السيستم...');
    // بننادي الميثود التجريدية
    _databaseService.saveStudent(id, name);
    print('عملية التسجيل تمت بالكامل بنجاح.\n');
  }
}

void main() {
  print('--- تشغيل كود التسجيل النظيف (Good DIP Example) ---');

  // سيناريو 1: العميل شغال بـ MySQL
  print('=== سيناريو تشغيل MySQL ===');
  final mysqlDb = MySqlDatabase();
  final systemWithMySql = StudentEnrollmentSystem(mysqlDb);
  systemWithMySql.enrollStudent('1001', 'سامح عبد العزيز');

  print('--------------------------------------------------');

  // سيناريو 2: قررنا ننقل لـ MongoDB (في ثواني وبدون تعديل كلاس السيستم!)
  print('=== سيناريو تشغيل MongoDB ===');
  final mongoDb = MongoDatabase();
  final systemWithMongo = StudentEnrollmentSystem(mongoDb);
  systemWithMongo.enrollStudent('1002', 'مروان الشافعي');
}
