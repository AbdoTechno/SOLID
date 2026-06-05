<div dir="rtl">

# شرح استخدام مبادئ SOLID في كود المشروع المبسط: explanation.md 🎯

شرح تفصيلي لتوزيع مبادئ SOLID الخمسة في الكود المصدري للمشروع المبسط:

---

## 1. مبدأ المسؤولية الواحدة: S (Single Responsibility)

مبدأ الـ SRP بيضمن إن كل كلاس مسؤول عن حاجة واحدة بس وما يتدخلش في شغل غيره:
* **كلاس `StudentRegistry`**: مسؤول فقط عن عملية تسجيل الطالب وحفظ ملفه.
* **كلاس `EnrollmentManager`**: مسؤول فقط عن تسجيل المادة للطالب والتحقق من الشروط.
* **كلاس `GradeBook`**: مسؤول فقط عن رصد الدرجات للطلاب.
* **كلاس `BaseStudent`**: مسؤول فقط عن الاحتفاظ ببيانات الطالب الأساسية.
* **كلاس `Course`**: مسؤول فقط عن بيانات الكورس.

---

## 2. مبدأ المفتوح والمغلق: O (Open-Closed)

المبدأ ده بيضمن إننا نقدر نزود ميزات وتفاصيل جديدة للسيستم من غير ما نعدل في كود الخدمات الرئيسي:
* **على مستوى الطلاب**: لو الجامعة قررت تضيف نوع طالب جديد (مثلاً طالب مغترب `ExchangeStudent` أو طالب منحة `ScholarshipStudent`)، كل اللي هنعمله هو عمل كلاس جديد بيورث من `BaseStudent` من غير ما نغير سطر واحد في كلاسات الخدمات (`StudentRegistry`, `EnrollmentManager`, `GradeBook`). السيستم هيتعامل مع النوع الجديد بالـ Polymorphism فوراً.
* **على مستوى التخزين**: كلاس `StudentRegistry` بيعتمد على واجهة `StudentRepository`. لو بكرة حبينا نحفظ في قاعدة بيانات حقيقية زي SQL أو Firebase، هنعمل كلاس جديد بيطبق الواجهة دي (مثل `SqlStudentRepository`) ونحقنه في الـ `main` من غير ما نغير كود كلاس `StudentRegistry` نفسه.

---

## 3. مبدأ إحلال ليسكوف: L (Liskov Substitution)

وده متطبق بوضوح شديد في الفصل بين الطالب العادي والطالب المستمع:
* **المشكلة الكلاسيكية**: الطالب المستمع `AuditStudent` بيحضر المحاضرات بس ملوش درجات ولا امتحانات. لو حطينا ميثود الدرجات جوة كلاس الأب `BaseStudent` وجينا في كلاس `AuditStudent` لغيناها بـ Exception، كدة كسرنا الـ LSP.
* **الحل**: سحبنا ميثودس الدرجات من كلاس الأب `BaseStudent` وحطيناها في واجهة منفصلة اسمها `Gradable`.
  - كلاس `CreditStudent` بيورث من الأب ويطبق `Gradable`.
  - كلاس `AuditStudent` بيورث من الأب بس ومش بيطبق `Gradable`.
* في كلاس رصد الدرجات `GradeBook`:
  ```dart
  if (student is Gradable) {
    (student as Gradable).addGrade(course, grade);
  }
  ```
  هنا السيستم بيتصرف بذكاء وأمان؛ لو الطالب مش مؤهل للدرجات بيخرج بأمان وبدون كراش (Runtime safety) وبدون ما نجبر الطالب المستمع ينفذ ميثود مش بتاعته.

---

## 4. مبدأ فصل الواجهات: I (Interface Segregation)

مطبق بالتكامل مع الـ LSP:
* عملنا واجهة صغيرة ورشيقة اسمها `Gradable` في ملف [models.dart](source-code/models.dart).
* كلاس `AuditStudent` مش مجبور يكتب أي ميثودس ميتة أو فارغة للدرجات لأنه مش بيطبق واجهة `Gradable` من الأساس. كلاس الطالب بيكتب ويطبق بس اللي بيفهمه ويحتاجه فعلاً في دوره.

---

## 5. مبدأ عكس الاعتمادية: D (Dependency Inversion)

مطبق في فك اللحام بين الخدمات ومخزن البيانات:
* كلاس `StudentRegistry` مش معتمد مباشرة على الكلاس المادي `InMemoryStudentRepository`. هو بيعتمد على التجريد (Abstraction) وهو واجهة `StudentRepository` المحددة في ملف [interfaces.dart](source-code/interfaces.dart).
* في ملف [main.dart](source-code/main.dart)، بنعمل **Dependency Injection** وبنباصي كائن الـ Repository المادي للـ Registry من برة. كدة كود البيزنس نظيف وغير متعشق في البنية التحتية.


</div>