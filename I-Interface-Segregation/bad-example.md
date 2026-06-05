<div dir="rtl">

# شرح الكود السيء (العك): bad-example.md ❌

في ملف الكود [bad.dart](code/bad.dart)، يوضح هذا المثال المشكلة المعمارية الناتجة عن الواجهات الضخمة (Monolithic Interfaces):

---

## 🧐 إيه العك اللي حصل هنا؟

إحنا عملنا واجهة تجريدية واحدة اسمها `UniversityMember` وحطينا فيها كل المهام الجامعية الممكنة:
```dart
abstract class UniversityMember {
  void attendClass();
  void submitAssignment();
  void teachCourse();
  void gradeExams();
  void calculateSalary();
}
```

المشكلة إن مفيش شخص واحد في الجامعة بيعمل كل الحاجات دي مع بعض! 
- الطالب بيحضر ويسلم واجبات، بس مش بيبع وشرح ويقبض مرتب مدرس.
- المدرس بيشرح ويصحح ويقبض مرتب، بس مش بيسلم واجبات للطلبة.

لما أجبرنا كلاس `Student` وكلاس `Teacher` يطبقوا الواجهة دي، المطور اضطر يكتب ميثودس ميتة (Dummy Methods) جواها `throw UnimplementedError()`.

---

## 🛑 الكوارث والمشاكل اللي هتحصل قدام (Maintenance Issues)

1. **انفجار البرنامج في الـ Runtime (Crash)**:
   لو المطور حب ينده ميثود `teachCourse()` على أوبجكت من نوع `Student` وهو فاكر إنه آمن لأنها جزء من واجهة `UniversityMember` المشتركة، البرنامج هيحصل فيه Crash فوري لأن الميثود دي بترمى `UnimplementedError`.

2. **كود مليان دهون وزبالة (Bloated Code)**:
   الملفات بتاعت الكلاسات بتتملي بـ Boilerplate code وميثودس فاضية ملهاش لازمة بس عشان نرضي الـ Compiler ونخليه يسكت. ده بيصعب قراءة الكود وتتبع المسؤوليات الحقيقية.

3. **تعديل واحد بيبوظ الدنيا (Fragile Hierarchy)**:
   تخيل لو الجامعة قررت تضيف ميثود جديدة للـ `UniversityMember` اسمها `scanFingerprintAtGate()` (لبصمة البوابة).
   المطور هيضطر يلف على كلاس `Student` وكلاس `Teacher` وكلاس `Janitor` وأي كلاس تاني في السيستم ويعدلهم عشان يكتب ميثود البصمة دي جواه، حتى لو في كلاسات مش محتاجة البصمة أصلاً! ده تعديل واسع ومزعج جداً (Shotgun Surgery).


</div>