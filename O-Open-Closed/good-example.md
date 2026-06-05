<div dir="rtl">

# شرح التصميم البرمجي المتوافق (Good Design): good-example.md

في ملف الكود [good.dart](code/good.dart)، قمنا بحل مشكلة تداخل المسؤوليات والاعتماديات باستخدام **التجريد (Abstraction)** و **تعدد الأشكال (Polymorphism)**:

---

## بنية الحل البرمجي الجديد

1. **إنشاء واجهة برمجية موحدة (`DiscountStrategy`)**:
   قمنا بإنشاء كلاس مجرد (Abstract Class) باسم `DiscountStrategy` يحتوي على دالة واحدة مجردة هي `calculateDiscount`. يمثل هذا الكلاس الواجهة القياسية الموحدة التي تحكم حساب كافة الخصومات.

2. **عزل كل فئة خصم في كلاس مستقل**:
   - كلاس `RegularDiscount` يقوم بتنفيذ (Implement) الواجهة ويحسب الخصم المخصص للفئة العادية.
   - كلاس `VipDiscount` ينفذ الواجهة ويطبق خصم العملاء المتميزين.
   - كلاس `ScholarshipDiscount` ينفذ الواجهة لتطبيق خصم المنح الدراسية.

3. **جعل كلاس الحسابات يعتمد على التجريد**:
   أصبح كلاس `DiscountCalculator` مستقلاً تمامًا عن تفاصيل فئات الطلاب وصيغ الحساب الخاصة بهم؛ حيث يستقبل السعر الأصلي وكائنًا يحقق الواجهة `DiscountStrategy` وينادي عليه:
   ```dart
   double calculate(double originalPrice, DiscountStrategy strategy) {
     return strategy.calculateDiscount(originalPrice);
   }
   ```

---

## الفوائد المعمارية وقابلية التوسع (Extensibility Advantages)

* **إضافة فئات خصم جديدة بسهولة**:
   إذا دعت الحاجة لإضافة خصم للموظفين (Staff) بنسبة 35%، فإننا نكتفي بكتابة كلاس جديد ينفذ الواجهة الموحدة دون تعديل الكود القائم:
   ```dart
   class StaffDiscount implements DiscountStrategy {
     @override
     double calculateDiscount(double originalPrice) => originalPrice * 0.35;
   }
   ```
   ويتم استدعاؤه في الدالة الرئيسية كالتالي:
   ```dart
   calculator.calculate(1000, StaffDiscount());
   ```
   نلاحظ هنا أننا لم نقم بفتح ملف `DiscountCalculator` أو تعديله، كما لم نغير أيًا من كلاسات الخصم السابقة، مما يعني أن الكود مغلق أمام التعديل ومفتوح للتمديد بنسبة 100%.

* **عزل كامل لمنطق العمليات (Encapsulation)**:
   تم عزل قواعد احتساب كل خصم داخل الكلاس الخاص به. فإذا حدث خطأ في حساب خصومات الفئة المتميزة (VIP)، نتوجه مباشرة إلى كلاس `VipDiscount` لمعالجته دون القلق من التأثير على كلاس `RegularDiscount`.

</div>