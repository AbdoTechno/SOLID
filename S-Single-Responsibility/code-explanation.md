<div dir="rtl">

# شرح الكود سطر بسطر: code-explanation.md 📝

شرح تفصيلي للكود النظيف المكتوب في ملف [good.dart](code/good.dart) سطر بسطر:

---

## 1. كلاس الطالب `Student`

```dart
class Student {
  final String id;
  final String name;
  final String email;
  final List<String> enrolledCourses = [];

  Student({required this.id, required this.name, required this.email});
```
- **المتغيرات (`id`, `name`, `email`)**: دي الخصائص الأساسية للطالب. المتغيرات هنا معرفة كـ `final` يعني قيمتها مش هتتغير بعد التحديد الأول، وده بيضمن ثبات البيانات وصحة الـ State.
- **القائمة `enrolledCourses`**: دي قائمة بتشيل أسماء الكورسات اللي الطالب متسجل فيها.
- **الكونسركتور**: بياخد البيانات المطلوبة باستخدام `required` عشان نضمن إن مفيش طالب يتنشئ من غير اسم أو إيميل.

```dart
  void enrollInCourse(String courseName) {
    enrolledCourses.add(courseName);
    print('تم تسجيل الطالب $name في كورس: $courseName');
  }
}
```
- **ميثود `enrollInCourse`**: وظيفتها تضيف كورس جديد لقائمة الكورسات وتطبع رسالة نجاح. دي الميثود الوحيدة هنا، وهي جوهر وظيفة الطالب (شؤونه الدراسية الخاصة بيه).

---

## 2. كلاس الريبوزتري `StudentRepository`

```dart
class StudentRepository {
  void saveToDatabase(Student student) {
    print('جاري الاتصال بقاعدة البيانات...');
    // محاكاة حفظ في الداتا بيز
    sleep(Duration(milliseconds: 500));
    print('تم حفظ الطالب ${student.name} بنجاح في جدول Students.');
  }
}
```
- **المسؤولية**: الكلاس ده معندوش أي متغيرات حالة (Properties)، هو كلاس خدمات (Service/Repository class).
- **ميثود `saveToDatabase`**:
  - بتاخد كائن من كلاس الـ `Student` كـ Parameter. ده بنسميه **Dependency Injection** خفيف؛ الكلاس مش بينشئ الطالب، هو بياخده جاهز عشان يحفظه.
  - بتستخدم `sleep(Duration(milliseconds: 500))` لمحاكاة التأخير اللي بيحصل لما نكلم قاعدة بيانات حقيقية.
  - بتطبع رسالة تأكيد الحفظ.
- **ليه ده سليم؟**: لو بكرة الصبح حبينا نحفظ في ملف JSON على الموبايل بدل الداتا بيز، هنغير الكود ده بس، والـ `Student` مش هيتأثر.

---

## 3. كلاس خدمة الإيميل `EmailService`

```dart
class EmailService {
  void sendWelcomeEmail(Student student) {
    print('جاري إرسال إيميل ترحيبي إلى ${student.email} ...');
    // محاكاة إرسال إيميل
    sleep(Duration(milliseconds: 500));
    print('تم إرسال الإيميل بنجاح: "أهلاً بك يا ${student.name} في كليتنا!"');
  }
}
```
- **المسؤولية**: الكلاس ده هو ساعي البريد الإلكتروني.
- **ميثود `sendWelcomeEmail`**:
  - بتاخد كائن `Student` برضه عشان تقرأ منه الإيميل والاسم.
  - بتطبع رسالة إرسال الإيميل مع محاكاة للشبكة (Network request simulation).
- **ليه ده سليم؟**: لو حبينا نغير تصميم الإيميل أو نستخدم باقة إرسال تانية، هنعدل في الميثود دي بس.

---

## 4. نقطة الانطلاق `main()`

```dart
void main() {
  print('--- تشغيل الكود النظيف (Good SRP Example) ---');
  
  // 1. بننشئ الطالب
  final student = Student(id: '101', name: 'أحمد محروس', email: 'ahmed@example.com');
  student.enrollInCourse('علم الحاسوب 101');
  
  // 2. بنحفظ الطالب عن طريق الريبوزتري المخصص
  final repo = StudentRepository();
  repo.saveToDatabase(student);
  
  // 3. بنبعت الإيميل عن طريق سيرفس الإيميل المخصصة
  final emailService = EmailService();
  emailService.sendWelcomeEmail(student);
}
```
- هنا بنجمع الأجزاء مع بعض في تناسق تام. كل كلاس بيكلم التاني بأدب ومن غير ما يكون لازق فيه.
- لو جيت تتبع الكود ده، هتلاقيه واضح جداً ومتقسم لخطوات منطقية ومنظمة.


</div>