<div dir="rtl">

# شرح الكود سطرًا بسطر لمبدأ LSP: code-explanation.md

شرح تفصيلي للتصميم البرمجي المتوافق المكتوب في ملف [good.dart](code/good.dart):

---

## 1. كلاس الأب التجريدي `Student`

```dart
abstract class Student {
  final String name;
  Student(this.name);

  void study();
}
```
- **`Student`**: الكلاس الأساسي المشترك لجميع فئات الطلاب في النظام.
- **`study()`**: دالة مجردة (Abstract Method). بما أن جميع الطلاب يشتركون في صفة الدراسة وحضور المحاضرات (كلٌ وفق أسلوبه)، تم الإعلان عنها كعقد برمجي يلتزم به أي كلاس يرث من `Student`.

---

## 2. كلاس المرشح للمنح `ScholarshipCandidate`

```dart
abstract class ScholarshipCandidate extends Student {
  ScholarshipCandidate(String name) : super(name);

  void applyForScholarship();
}
```
- **`extends Student`**: كلاس مجرد يرث من الكلاس الأساسي `Student`.
- **`applyForScholarship()`**: دالة إضافية مخصصة لفئة الطلاب المؤهلين لتقديم طلبات المنح الدراسية فقط. ويضمن هذا الفصل عدم إتاحة ميزة التقديم للمنح للفئات غير المؤهلة.

---

## 3. كلاسات الطلاب الحقيقية (Concrete Classes)

### الطالب المنتظم `RegularStudent`
```dart
class RegularStudent extends ScholarshipCandidate {
  RegularStudent(String name) : super(name);

  @override
  void study() {
    print('$name بيذاكر المحاضرات ويحل التكليفات.');
  }

  @override
  void applyForScholarship() {
    print('$name قدم على المنحة الدراسية بنجاح.');
  }
}
```
- يرث من الكلاس الوسيط `ScholarshipCandidate`؛ وبالتالي يرث كلتا الدالتين: دالة الدراسة ودالة التقديم للمنحة.
- يعيد تعريف الدالتين (`@override`) ويحدد سلوكهما الفعلي دون إلقاء استثناءات أو أخطاء.

### الطالب المستمع `AuditorStudent`
```dart
class AuditorStudent extends Student {
  AuditorStudent(String name) : super(name);

  @override
  void study() {
    print('$name بيحضر المحاضرات للاستماع فقط بدون امتحانات.');
  }
}
```
- يرث من كلاس الأب `Student` مباشرة؛ وبالتالي لا يرث سوى دالة الدراسة `study()`.
- لا يحتوي الكلاس على دالة التقديم للمنحة، مما يقيه من الاضطرار لكتابة وظائف غير متوافقة مع طبيعته أو إلقاء استثناءات لتعطيل سلوك موروث غير مرغوب فيه.

---

## 4. دالة المعالجة الفنية ونقطة الانطلاق `main()`

```dart
void processScholarshipApplications(List<ScholarshipCandidate> candidates) {
  for (var candidate in candidates) {
    candidate.applyForScholarship();
  }
}
```
- تم تحديد نوع المدخلات في الدالة لتستقبل قائمة من نوع `List<ScholarshipCandidate>` بدلاً من القائمة العامة للطلاب. يضمن ذلك على مستوى المترجم (Compile-time) أن كافة العناصر الممررة تدعم دالة التقديم للمنحة ولن تتسبب في حدوث أخطاء أثناء التشغيل.

```dart
  final List<ScholarshipCandidate> scholarshipCandidates = allStudents
      .whereType<ScholarshipCandidate>()
      .toList();
```
- في الدالة الرئيسية `main` يتم استخدام الدالة `whereType<ScholarshipCandidate>()` لتصفية قائمة الطلاب العامة واقتطاع الطلاب المؤهلين للمنح فقط وتمريرهم للدالة المعنية بأمان تام، بما يتوافق بالكامل مع معايير مبدأ LSP.

</div>