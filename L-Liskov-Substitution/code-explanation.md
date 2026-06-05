<div dir="rtl">

# شرح الكود سطر بسطر لمبدأ LSP: code-explanation.md 📝

شرح تفصيلي للكود النظيف المكتوب في ملف [good.dart](code/good.dart) سطر بسطر:

---

## 1. كلاس الأب التجريدي `Student`

```dart
abstract class Student {
  final String name;
  Student(this.name);

  void study();
}
```
- **`Student`**: ده كلاس أب مشترك لكل الطلاب.
- **`study()`**: ميثود تجريدية (Abstract Method). بما إن كل الطلاب بيذاكروا (بطريقتهم)، فالميثود دي فرضناها كعقد على أي طالب يدخل الكلية. كلاس `AuditorStudent` وكلاس `ScholarshipCandidate` مجبرين يكتبوا السلوك بتاعها.

---

## 2. كلاس المرشح للمنح `ScholarshipCandidate`

```dart
abstract class ScholarshipCandidate extends Student {
  ScholarshipCandidate(String name) : super(name);

  void applyForScholarship();
}
```
- **`extends Student`**: هو كلاس ابن من `Student` بس هو برضه كلاس تجريدي (`abstract`).
- **`applyForScholarship()`**: دي ميثود جديدة ضفناها هنا **بس**. ده معناه إن كلاسات الطلاب اللي هتورث من `ScholarshipCandidate` هي بس اللي هيكون عندها إمكانية تقديم المنح.

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
- بيرث من `ScholarshipCandidate` يعني وارث ميثود الـ `study` وميثود الـ `applyForScholarship`.
- عملنا `@override` للاتنين وكتبنا كود حقيقي من غير ما نرمي Exceptions.

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
- بيرث من `Student` مباشرة. ده معناه إنه وارث ميثود `study()` **بس**.
- ميثود `applyForScholarship` مش موجودة عنده أصلاً. وبكدة ريحنا الكلاس ده من إنه يكتب كود مش بتاعه أو يرمي Exception عشان يلغي سلوك موروث.

---

## 4. ميثود المعالجة والـ `main`

```dart
void processScholarshipApplications(List<ScholarshipCandidate> candidates) {
  for (var candidate in candidates) {
    candidate.applyForScholarship();
  }
}
```
- الميثود دي بقت تطلب `List<ScholarshipCandidate>` بدل `List<Student>`. كدة الـ Compiler بيضمن إن أي عنصر يدخل اللوب دي هو مؤهل تماماً وعنده ميثود `applyForScholarship` حقيقية ومستحيل يرمي Exception.

```dart
  final List<ScholarshipCandidate> scholarshipCandidates = allStudents
      .whereType<ScholarshipCandidate>()
      .toList();
```
- في الـ `main` بنستخدم `whereType<ScholarshipCandidate>()` عشان نلتقط الطلاب المؤهلين للمنح فقط من اللستة العامة ونباصيهم لـ `processScholarshipApplications` بأمان تام.
- ده كود نظيف ومتوقع ومحترم للـ LSP بنسبة 100%.


</div>