<div dir="rtl">

# شرح الكود سطرًا بسطر: code-explanation.md

شرح تفصيلي للتصميم البرمجي المتوافق المكتوب في ملف [good.dart](code/good.dart):

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
- **المتغيرات (`id`, `name`, `email`)**: تمثل الخصائص الأساسية للطالب. تم تعريف هذه المتغيرات بتهيئة ثابتة `final` مما يعني عدم إمكانية تعديلها بعد التحديد الأول، وهو ما يضمن استقرار وثبات حالة الكائن (Object State).
- **القائمة `enrolledCourses`**: قائمة مخصصة لتخزين أسماء المواد الدراسية التي يسجل فيها الطالب.
- **مشيد الكلاس (Constructor)**: يستقبل البيانات المطلوبة باستخدام الكلمة المفتاحية `required` لضمان عدم إنشاء كائن طالب دون تزويد المعرف والاسم والبريد الإلكتروني.

```dart
  void enrollInCourse(String courseName) {
    enrolledCourses.add(courseName);
    print('تم تسجيل الطالب $name في كورس: $courseName');
  }
}
```
- **الدالة `enrollInCourse`**: تختص بإضافة مادة دراسية جديدة لقائمة الطالب وطباعة رسالة تأكيد. تمثل هذه الدالة جوهر مسؤولية الطالب الأكاديمية.

---

## 2. كلاس مستودع حفظ البيانات `StudentRepository`

```dart
class StudentRepository {
  void saveToDatabase(Student student) {
    print('جاري الاتصال بقاعدة البيانات...');
    // محاكاة حفظ في قاعدة البيانات
    sleep(Duration(milliseconds: 500));
    print('تم حفظ الطالب ${student.name} بنجاح في جدول Students.');
  }
}
```
- **المسؤولية**: لا يحتوي هذا الكلاس على متغيرات حالة، وإنما يمثل كلاس خدمة (Service/Repository Class) يختص بعمليات التخزين.
- **الدالة `saveToDatabase`**:
  - تستقبل كائنًا من نوع `Student` كمعامل (Parameter). يمثل هذا النمط حقنًا بسيطًا للاعتمادية (Dependency Injection)؛ حيث لا يتولى الكلاس إنشاء كائن الطالب بنفسه، بل يستقبله جاهزًا لأداء عملية الحفظ.
  - تستخدم الدالة `sleep(Duration(milliseconds: 500))` لمحاكاة التأخير الزمني الفعلي المصاحب لعمليات الاتصال بقواعد البيانات الحقيقية.
  - تطبع رسالة تأكيد تفيد بنجاح عملية الحفظ.
- **أهمية التصميم**: في حال تغيير وسيط التخزين إلى ملف JSON أو نظام آخر، يقتصر التعديل على هذا المكون فقط دون أي تأثير على منطق كلاس `Student`.

---

## 3. كلاس خدمة البريد الإلكتروني `EmailService`

```dart
class EmailService {
  void sendWelcomeEmail(Student student) {
    print('جاري إرسال إيميل ترحيبي إلى ${student.email} ...');
    // محاكاة إرسال بريد إلكتروني
    sleep(Duration(milliseconds: 500));
    print('تم إرسال الإيميل بنجاح: "أهلاً بك يا ${student.name} في كليتنا!"');
  }
}
```
- **المسؤولية**: يختص هذا الكلاس بالاتصال بالشبكة وإرسال رسائل البريد الإلكتروني.
- **الدالة `sendWelcomeEmail`**:
  - تستقبل كائن `Student` لقراءة اسم الطالب وبريده الإلكتروني.
  - تطبع رسالة محاكاة لإرسال البريد الإلكتروني عبر الشبكة.
- **أهمية التصميم**: تعديل محتوى الرسالة أو تغيير مزود الخدمة يتم بشكل مستقل تمامًا داخل هذا الكلاس.

---

## 4. نقطة الانطلاق `main()`

```dart
void main() {
  print('--- تشغيل الكود النظيف (Good SRP Example) ---');
  
  // 1. إنشاء كائن الطالب وتنسيق تسجيل المواد الدراسية
  final student = Student(id: '101', name: 'أحمد محروس', email: 'ahmed@example.com');
  student.enrollInCourse('علم الحاسوب 101');
  
  // 2. حفظ بيانات الطالب عبر المستودع المخصص للعملية
  final repo = StudentRepository();
  repo.saveToDatabase(student);
  
  // 3. إرسال البريد الإلكتروني الترحيبي بواسطة الخدمة المعنية
  final emailService = EmailService();
  emailService.sendWelcomeEmail(student);
}
```
- يعكس منطق الدالة الرئيسية تكامل المكونات المستقلة معًا بانسيابية؛ حيث يؤدي كل كلاس وظيفته دون ترابط وثيق مباشر (Loose Coupling) مع الكلاسات الأخرى.
- يسهل تتبع الكود وقراءته نتيجة تقسيمه إلى خطوات منطقية مستقلة ومنظمة.

</div>