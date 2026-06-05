<div dir="rtl">

# شرح الكود سطر بسطر لمبدأ ISP: code-explanation.md 📝

شرح تفصيلي للكود النظيف المكتوب في ملف [good.dart](code/good.dart) سطر بسطر:

---

## 1. تقسيم الواجهات لـ 4 عقود منفصلة

```dart
abstract class ClassAttendee {
  void attendClass();
}
```
- **واجهة `ClassAttendee`**: مخصصة فقط لأي شخص بيحضر محاضرات. فيها ميثود واحدة وهي `attendClass()`.

```dart
abstract class AssignmentSubmitter {
  void submitAssignment();
}
```
- **واجهة `AssignmentSubmitter`**: مخصصة فقط للناس اللي بتسلم واجبات وتكليفات. فيها ميثود `submitAssignment()`.

```dart
abstract class CourseInstructor {
  void teachCourse();
  void gradeExams();
}
```
- **واجهة `CourseInstructor`**: مخصصة للمدرسين اللي بيدرسوا ويصححوا الامتحانات. فيها ميثودس: `teachCourse` و `gradeExams`.

```dart
abstract class SalariedEmployee {
  void calculateSalary();
}
```
- **واجهة `SalariedEmployee`**: مخصصة للموظفين اللي بيقبضوا مرتبات من الإدارة. فيها ميثود `calculateSalary`.

---

## 2. كلاس الطالب `Student`

```dart
class Student implements ClassAttendee, AssignmentSubmitter {
  final String name;
  Student(this.name);
```
- **`implements ClassAttendee, AssignmentSubmitter`**: الطالب بيختار يطبق العقدين دول بس. هو بيحضر محاضرات وبيسلم واجبات.
- **التنفيذ**: الكلاس بيعمل `@override` لميثود `attendClass` وميثود `submitAssignment` ويكتب اللوجيك بتاعهم الحقيقي. ومفيش أي ميثودس زيادة أو ميتة مفروضة عليه.

---

## 3. كلاس المدرس `Teacher`

```dart
class Teacher implements ClassAttendee, CourseInstructor, SalariedEmployee {
  final String name;
  Teacher(this.name);
```
- **`implements ClassAttendee, CourseInstructor, SalariedEmployee`**: الدكتور بيحضر المدرج (`ClassAttendee`) بس عشان يشرح مش عشان يقعد يسمع، وبيدرس ويصحح (`CourseInstructor`) وكمان بيقبض مرتب (`SalariedEmployee`).
- **التنفيذ**: عملنا `@override` للأربع ميثودس بتوع الواجهات دي وكتبنا كودهم.
- لاحظ إن كلاس `Teacher` معملش implement لـ `AssignmentSubmitter` لأنه مش بيسلم واجبات، وبكدة حميناه من وجود ميثود ميتة.

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
- بننشئ الأوبجكتس وبننادي الميثودس بتاعتهم بشكل مباشر وطبيعي.
- مفيش أي كود محمي بـ `try-catch` عشان خايفين يرمي `UnimplementedError` زي الكود القديم العك، لأن الـ Compiler ضامن إن كل كائن مفيهوش ميثودس غريبة مش بتاعته.
- التصميم ده أمن، واضح، وقابل للتمدد بمنتهى السهولة.


</div>