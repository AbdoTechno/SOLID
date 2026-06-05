<div dir="rtl">

# شرح الكود سطرًا بسطر لمبدأ ISP: code-explanation.md

شرح تفصيلي للتصميم البرمجي المتوافق المكتوب في ملف [good.dart](code/good.dart):

---

## 1. تقسيم الواجهات البرمجية إلى أربعة عقود منفصلة

```dart
abstract class ClassAttendee {
  void attendClass();
}
```
- **واجهة `ClassAttendee`**: مخصصة فقط لكل من يحضر المحاضرات الفعالة. تحتوي على دالة واحدة هي `attendClass()`.

```dart
abstract class AssignmentSubmitter {
  void submitAssignment();
}
```
- **واجهة `AssignmentSubmitter`**: مخصصة فقط لمن تسند إليهم تكليفات وواجبات دراسية لتسليمها. تحتوي على دالة `submitAssignment()`.

```dart
abstract class CourseInstructor {
  void teachCourse();
  void gradeExams();
}
```
- **واجهة `CourseInstructor`**: مخصصة للهيئة التدريسية التي تتولى إلقاء المحاضرات وتصحيح الاختبارات. تحتوي على دالتين: `teachCourse` و `gradeExams`.

```dart
abstract class SalariedEmployee {
  void calculateSalary();
}
```
- **واجهة `SalariedEmployee`**: مخصصة لكل من يتقاضى راتبًا ماليًا من إدارة المؤسسة. تحتوي على دالة `calculateSalary()`.

---

## 2. كلاس الطالب `Student`

```dart
class Student implements ClassAttendee, AssignmentSubmitter {
  final String name;
  Student(this.name);
```
- **`implements ClassAttendee, AssignmentSubmitter`**: يقوم كلاس الطالب بتنفيذ هاتين الواجهتين فقط لمطابقتهما لاختصاصه ودوره الأكاديمي الفعلي.
- **التنفيذ**: يلتزم الكلاس بإعادة تعريف ودعم دالة حضور المحاضرة ودالة تسليم الواجب، دون وجود أي دوال إضافية غير مرغوب فيها.

---

## 3. كلاس المدرس `Teacher`

```dart
class Teacher implements ClassAttendee, CourseInstructor, SalariedEmployee {
  final String name;
  Teacher(this.name);
```
- **`implements ClassAttendee, CourseInstructor, SalariedEmployee`**: يقوم كلاس المدرس بتنفيذ الواجهات الملائمة لدوره؛ حيث يتواجد بقاعة المحاضرات (`ClassAttendee`)، ويتولى التدريس والتقييم (`CourseInstructor`)، ويتقاضى راتبًا ماليًا (`SalariedEmployee`).
- **التنفيذ**: يلتزم الكلاس بإعادة تعريف الدوال المرتبطة بهذه الواجهات وكتابة منطق تشغيلها الفعلي.
- نلاحظ أن كلاس `Teacher` لم ينفذ واجهة `AssignmentSubmitter` لعدم مطالبته بتسليم تكليفات دراسية، مما يحميه من وجود دوال ميتة أو فارغة.

---

## 4. نقطة الانطلاق `main()`

```dart
void main() {
  final student = Student('كريم يوسف');
  student.attendClass();
  student.submitAssignment();

  final teacher = Teacher('د. أحمد جمال');
  teacher.attendClass();
  teacher.teachCourse();
  ...
}
```
- يتم إنشاء الكائنات واستدعاء دوالها بشكل مباشر وانسيابي.
- الكود خالٍ تمامًا من جمل معالجة الأخطاء `try-catch` المرتبطة بمخاوف استدعاء وظائف غير منفذة، نظرًا لأن المترجم يضمن خلو الكلاسات من دوال لا تدعمها بنيتها الأساسية.
- يوضح التصميم مدى توافق الكود وأمانه وقابليته للتطوير بيسر.

</div>