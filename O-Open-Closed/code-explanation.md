<div dir="rtl">

# شرح الكود سطرًا بسطر لمبدأ OCP: code-explanation.md

شرح تفصيلي للتصميم البرمجي المتوافق المكتوب في ملف [good.dart](code/good.dart):

---

## 1. التجريد (Abstraction)

```dart
abstract class DiscountStrategy {
  double calculateDiscount(double originalPrice);
}
```
- **`abstract class`**: كلاس تجريدي، لا يمكن إنشاء كائن (Instance) منه مباشرة. يهدف إلى توفير واجهة برمجية موحدة بمثابة عقد تلتزم به الكلاسات المشتقة.
- **الدالة `calculateDiscount`**: دالة مجردة دون تنفيذ (Without Body)، تعلن فقط عن الاسم والمعاملات ونوع القيمة المرجعة (`double`). أي كلاس يقوم بتنفيذ (Implement) هذه الواجهة يجب عليه كتابة تفاصيل تشغيل هذه الدالة.

---

## 2. التطبيقات العملية (Concrete Strategies)

```dart
class RegularDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.10; // خصم 10%
  }
}
```
- **`implements DiscountStrategy`**: تشير إلى التزام كلاس `RegularDiscount` بتنفيذ الواجهة البرمجية المجردة وتقديم الآلية المناسبة لحساب خصم الفئة العادية.
- **`@override`**: توجيه للمترجم (Compiler) في لغة Dart يفيد بإعادة كتابة سلوك الدالة المعرفة في الواجهة الأب.
- **المنطق الحسابي**: ضرب السعر الأصلي في القيمة `0.10` لاستخراج الخصم (10%). ويتكرر نفس المفهوم مع بقية الفئات مثل `VipDiscount` و `ScholarshipDiscount` بنسب مختلفة.

---

## 3. كلاس الحساب `DiscountCalculator`

```dart
class DiscountCalculator {
  double calculate(double originalPrice, DiscountStrategy strategy) {
    return strategy.calculateDiscount(originalPrice);
  }
}
```
- يكمن جوهر التصميم هنا؛ حيث أصبح كلاس `DiscountCalculator` مستقلاً تمامًا عن تفاصيل الفئات الحسابية المختلفة.
- **المعامل `strategy`**: تستقبل الدالة معاملًا من نوع الواجهة التجريدية `DiscountStrategy`.
- **التنفيذ الفعلي**: يتم استدعاء الدالة `strategy.calculateDiscount(originalPrice)`. وهنا يظهر مفهوم **تعدد الأشكال (Polymorphism)**؛ ففي مرحلة التشغيل (Runtime)، يتم تحديد الدالة المناسبة بناءً على كائن الخصم الممرر (سواء كان `VipDiscount` أو غيره). كود هذا الكلاس يظل ثابتًا ومحميًا من التعديل مستقبلاً، على الرغم من مرونته الكاملة للتعامل مع أي خصومات جديدة مضافة.

---

## 4. نقطة الانطلاق `main()`

```dart
void main() {
  final calculator = DiscountCalculator();

  final regular = calculator.calculate(1000, RegularDiscount());
  final vip = calculator.calculate(1000, VipDiscount());
  final staff = calculator.calculate(1000, StaffDiscount());
  ...
}
```
- يتم إنشاء كائن المحاسب لمرة واحدة.
- لحساب قيمة الخصم، نقوم بتمرير السعر الأصلي وكائن الاستراتيجية المطلوب تطبيقها (مثل `RegularDiscount()`).
- يوضح الكود إمكانية تشغيل `StaffDiscount` المضاف حديثًا دون الحاجة لتغيير أي جزء من كلاس `DiscountCalculator` المستقر، مما يعكس متانة الكود وأمانه.

</div>