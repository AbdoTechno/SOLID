<div dir="rtl">

# شرح الكود سطر بسطر لمبدأ DIP: code-explanation.md 📝

شرح تفصيلي للكود النظيف المكتوب في ملف [good.dart](code/good.dart) سطر بسطر:

---

## 1. التجريد (Abstraction)

```dart
abstract class DatabaseService {
  void saveStudent(String id, String name);
}
```
- **`DatabaseService`**: ده كلاس تجريدي بيمثل "الفيشة القياسية". مش بيهتم قاعدة البيانات بتشتغل إزاي، هو بس بيوعد إن اللي هيطبقه هيكون عنده ميثود اسمها `saveStudent` بتاخد `id` و `name`.

---

## 2. الموديلات منخفضة المستوى (Low-level Modules)

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
- **`implements DatabaseService`**: كلاس `MySqlDatabase` بيمضي على العقد. وبيكتب كود الحفظ الفعلي الخاص بـ MySQL.
- نفس الكلام بيتكرر مع كلاس `MongoDatabase` بس بكود حفظ خاص بـ MongoDB. الكلاسين دول هما "التفاصيل المادية" (Details).

---

## 3. الموديول عالي المستوى (High-level Module)

```dart
class StudentEnrollmentSystem {
  final DatabaseService _databaseService;

  StudentEnrollmentSystem(this._databaseService);
```
- **`final DatabaseService _databaseService;`**: الكلاس بيشير للـ `DatabaseService` (الواجهة التجريدية) مش لكلاس MySQL أو Mongo المادي. ده تطبيق مباشر للشق الأول من المبدأ.
- **`StudentEnrollmentSystem(this._databaseService);`**: كونسركتور الكلاس بيستقبل الخدمة من برة (Dependency Injection). كلاس البيزنس مش بينشئ الكائن بنفسه بـ `new` أو `MySqlDatabase()`، هو بياخده جاهز على الشغل.

```dart
  void enrollStudent(String id, String name) {
    print('بدء عملية تسجيل الطالب $name في السيستم...');
    _databaseService.saveStudent(id, name);
    print('عملية التسجيل تمت بالكامل بنجاح.\n');
  }
}
```
- **`enrollStudent`**: ميثود البيزنس الرئيسي. بتنادي ميثود الحفظ التجريدية. وقت التشغيل (Runtime)، لو باصينا ليها `MySqlDatabase` هيتحفظ في MySQL، ولو باصينا `MongoDatabase` هيتحفظ في Mongo، والكود ده ثابت ومش هيتأثر.

---

## 4. نقطة الانطلاق `main()`

```dart
void main() {
  final mysqlDb = MySqlDatabase();
  final systemWithMySql = StudentEnrollmentSystem(mysqlDb);
  systemWithMySql.enrollStudent('1001', 'سامح عبد العزيز');
```
- بننشئ كائن الـ Database المادي أولاً.
- بنحقنه (Inject) جوة كونسركتور `StudentEnrollmentSystem`.
- بنشغل كود التسجيل وهيحفظ في MySQL.
- لو حبينا نغير لـ MongoDB، بنعمل كائن `MongoDatabase` ونحقنه هو، السيستم هيشتغل مع MongoDB فوراً ومن غير أي تعديل داخلي.
- ده كود مرن، نظيف، ومحترم للـ DIP بنسبة 100%.


</div>