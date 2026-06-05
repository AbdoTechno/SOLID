<div dir="rtl">

# شرح تفصيلي لكود مبدأ عكس الاعتمادية (DIP)

شرح تفصيلي للكود المكتوب في ملف [good.dart](code/good.dart) سطر بسطر:

---

## 1. التجريد (Abstraction)

```dart
abstract class DatabaseService {
  void saveStudent(String id, String name);
}
```
- **`DatabaseService`**: هي فئة مجردة (Abstract Class) تمثل واجهة الاتصال القياسية. لا تهتم هذه الفئة بكيفية عمل قاعدة البيانات تفصيلياً، بل تضمن فقط أن أي فئة تنفذها ستوفر دالة باسم `saveStudent` تستقبل المعاملات `id` و `name`.

---

## 2. الوحدات منخفضة المستوى (Low-level Modules)

```dart
class MySqlDatabase implements DatabaseService {
  @override
  void saveStudent(String id, String name) {
    print('جاري الاتصال بقاعدة بيانات MySQL...');
    sleep(Duration(milliseconds: 400));
    print('تم حفظ الطالب $name (ID: $id) في جدول MySQL Students.');
  }
}
```
- **`implements DatabaseService`**: تشير إلى التزام الفئة `MySqlDatabase` بتنفيذ الواجهة المحددة، وكتابة كود الحفظ الفعلي الخاص بقاعدة بيانات MySQL.
- ينطبق الأمر نفسه على الفئة `MongoDatabase` ولكن باستخدام كود الحفظ الخاص بقاعدة بيانات MongoDB. تمثل هاتان الفئتان التفاصيل الفنية المادية (Details).

---

## 3. الوحدة عالية المستوى (High-level Module)

```dart
class StudentEnrollmentSystem {
  final DatabaseService _databaseService;

  StudentEnrollmentSystem(this._databaseService);
```
- **`final DatabaseService _databaseService;`**: تعتمد الفئة هنا على الواجهة المجردة `DatabaseService` بدلاً من الاعتماد المباشر على فئة مادية محددة (مثل `MySqlDatabase` أو `MongoDatabase`). يعد هذا تطبيقاً مباشراً للشق الأول من المبدأ.
- **`StudentEnrollmentSystem(this._databaseService);`**: يستقبل مشيد الفئة الخدمة المطلوبة من الخارج عبر آلية حقن الاعتمادية (Dependency Injection). وبذلك، لا تقوم فئة منطق العمل بإنشاء الكائن بنفسها، بل تستقبله جاهزاً للاستخدام.

```dart
  void enrollStudent(String id, String name) {
    print('بدء عملية تسجيل الطالب $name في النظام...');
    _databaseService.saveStudent(id, name);
    print('عملية التسجيل تمت بالكامل بنجاح.\n');
  }
}
```
- **`enrollStudent`**: الدالة الأساسية لمنطق العمل، وتقوم باستدعاء دالة الحفظ المجردة. في مرحلة التشغيل (Runtime)، إذا تم تمرير كائن `MySqlDatabase` فسيتم الحفظ في قاعدة بيانات MySQL، وإذا تم تمرير كائن `MongoDatabase` فسيتم الحفظ في قاعدة بيانات MongoDB، دون الحاجة لتغيير كود هذه الدالة.

---

## 4. نقطة الانطلاق `main()`

```dart
void main() {
  final mysqlDb = MySqlDatabase();
  final systemWithMySql = StudentEnrollmentSystem(mysqlDb);
  systemWithMySql.enrollStudent('1001', 'سامح عبد العزيز');
```
- يتم إنشاء كائن قاعدة البيانات المادي أولاً.
- يتم حقن هذا الكائن داخل مشيد الفئة `StudentEnrollmentSystem`.
- يتم تشغيل عملية التسجيل ليتم الحفظ في قاعدة البيانات المحددة.
- لتغيير نظام قواعد البيانات إلى MongoDB، يتم إنشاء كائن `MongoDatabase` وحقنه في المشيد، وسيعمل النظام مباشرة دون الحاجة لأي تعديل داخلي.
- يمثل هذا التصميم بنية برمجية مرنة ومنظمة تتوافق تماماً مع مبدأ عكس الاعتمادية (DIP).

</div>