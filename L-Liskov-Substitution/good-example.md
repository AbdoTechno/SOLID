<div dir="rtl">

# شرح الكود النظيف: good-example.md ✅

في ملف الكود [good.dart](code/good.dart)، قمنا بإعادة التفكير في شجرة الوراثة (Hierarchy) وتصحيح توزيع المسؤوليات كما يلي:

---

## 🏗️ إزاي صلحنا الكود؟

1. **حطنا السلوك المشترك الفعلي في الأب (`Student`)**:
   كل الطلاب في الجامعة بيذاكروا ويحضروا محاضرات، عشان كدة كلاس `Student` بقى فيه ميثود واحدة بس وهي `study()`.

2. **عملنا كلاس وسيط للتقديم على المنح (`ScholarshipCandidate`)**:
   ده كلاس ابن من `Student` بس مخصص للناس اللي ينفع تقدم على منح. وحطينا جواه ميثود `applyForScholarship()`.

3. **وزعنا الكلاسات صح**:
   - كلاس `RegularStudent` ورث من `ScholarshipCandidate` (لأنه بيدرس ومؤهل للمنحة).
   - كلاس `AuditorStudent` ورث مباشرة من `Student` (لأنه بيدرس بس مش مؤهل للمنحة).

---

## 🎉 الفوائد والمميزات المعمارية

* **أمان 100% في وقت التشغيل (Type Safety)**:
  الميثود المسؤولية عن تقديم المنح بقت تستقبل قائمة من نوع `List<ScholarshipCandidate>`:
  ```dart
  void processScholarshipApplications(List<ScholarshipCandidate> candidates) { ... }
  ```
  هنا الـ Compiler بتاع Dart مستحيل يسمحلك تباصي طالب مستمع (`AuditorStudent`) للميثود دي، لأن نوعه مش متوافق مع `ScholarshipCandidate`. كدة حلينا المشكلة قبل ما الكود يرن أصلاً (Compile-time safety)!

* **احترام كامل لعقد الـ LSP**:
  أي كلاس ابن لـ `Student` (سواء منتظم أو مستمع) يقدر يسد مكان الأب في أي مكان محتاج `study()` من غير ما يرمي Exceptions أو يغير السلوك المتوقع.

* **كود سلكان من غير ترقيع**:
  مبقاش عندنا أي `if (student is AuditorStudent)` ولا حاجة. بنستخدم الـ Polymorphism بشكل طبيعي وصحي ونظيف.


</div>