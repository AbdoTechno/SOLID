<div dir="rtl">

# شرح الكود النظيف: good-example.md ✅

في ملف الكود [good.dart](code/good.dart)، قمنا بحل المشكلة باستخدام **الـ Polymorphism والتجريد (Abstraction)**:

---

## 🏗️ إزاي صلحنا الكود؟

1. **عملنا كرت لتحديد الشروط (`DiscountStrategy`)**:
   عملنا `abstract class` اسمه `DiscountStrategy` فيه ميثود واحدة اسمها `calculateDiscount`. ده يعتبر "الفيشة القياسية" أو "المشترك" بتاعنا.

2. **كل نوع خصم بقى كلاس مستقل**:
   - كلاس `RegularDiscount` بيطبق الواجهة دي بطريقته.
   - كلاس `VipDiscount` بيطبقها بطريقته.
   - كلاس `ScholarshipDiscount` بيطبقها بطريقته.

3. **كلاس المحاسب صار أعمى البصر والبصيرة عن التفاصيل**:
   كلاس `DiscountCalculator` بقى ملوش دعوة إنت نوعك إيه بالظبط! هو بياخد السعر وبياخد معاه أي كلاس بيحقق الـ `DiscountStrategy` وينادي عليه:
   ```dart
   double calculate(double originalPrice, DiscountStrategy strategy) {
     return strategy.calculateDiscount(originalPrice);
   }
   ```

---

## 🎉 الفوائد المعمارية والتمدد (Extensibility Advantages)

* **إضافة خصم جديد بضغطة زر**:
   تخيل الجامعة قررت تضيف خصم جديد للموظفين (Staff) بنسبة 35%. كل اللي عملناه هو كتابة كلاس جديد خالص:
   ```dart
   class StaffDiscount implements DiscountStrategy {
     @override
     double calculateDiscount(double originalPrice) => originalPrice * 0.35;
   }
   ```
   ورحنا ناديناه في الـ `main` كدة:
   ```dart
   calculator.calculate(1000, StaffDiscount());
   ```
   **هل فتحنا ملف `DiscountCalculator` وعدلنا فيه؟** لا!
   **هل غيرنا في كلاسات الخصم القديمة؟** لا!
   ده معناه إن الكلاس الرئيسي مغلق تماماً للتعديل ومفتوح للتمديد بنسبة 100%.

* **عزل كامل للوجيك (Encapsulation)**:
   كل خصم وقواعد الحساب بتاعته معزولة في ملفها وكلاسها الخاص. لو في مشكلة في حساب خصم الـ VIP، هتروح لملف `VipDiscount` وتصلحه وأنت متطمن إنك مش هتهبب حاجة في خصم الـ Regular.


</div>