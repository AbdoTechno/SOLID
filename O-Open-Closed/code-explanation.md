<div dir="rtl">

# شرح الكود سطر بسطر لمبدأ OCP: code-explanation.md 📝

شرح تفصيلي للكود النظيف المكتوب في ملف [good.dart](code/good.dart) سطر بسطر:

---

## 1. التجريد (Abstraction)

```dart
abstract class DiscountStrategy {
  double calculateDiscount(double originalPrice);
}
```
- **`abstract class`**: ده كلاس تجريدي، يعني ما ينفعش تاخد منه كائن (Instance) مباشرة باستخدام `new` أو المسمى المباشر. هو معمول عشان يكون "عقد" أو "كتالوج" الكلاسات التانية تمشي عليه.
- **ميثود `calculateDiscount`**: دي ميثود ملهاش جسم (Body)، يعني ميثود صامتة بتعلن بس عن اسمها والباراميترز اللي محتاجاها ونوع القيمة اللي هترجعها (`double`). أي كلاس هيعمل ورايا `implements` لازم يكتب جسم الميثود دي ويوضح بتشتغل إزاي.

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
- **`implements DiscountStrategy`**: الكلمة دي معناها إن كلاس `RegularDiscount` بيمضي على العقد. وبيقول: "أنا ملتزم بتقديم طريقة لحساب الخصم للطالب العادي".
- **`@override`**: بنقول للغة Dart إننا بنكتب السلوك الخاص بينا للميثود المذكورة في العقد الأب.
- **المنطق**: بنضرب السعر الأصلي في 0.10 عشان نطلع قيمة الخصم. نفس الكلام بيتكرر مع `VipDiscount` و `ScholarshipDiscount` بس بنسب مختلفة.

---

## 3. كلاس الحساب الذكي `DiscountCalculator`

```dart
class DiscountCalculator {
  double calculate(double originalPrice, DiscountStrategy strategy) {
    return strategy.calculateDiscount(originalPrice);
  }
}
```
- **السحر كله هنا**: كلاس `DiscountCalculator` بقى كلاس غلبان جداً ومحترم. ملوش علاقة بالـ `Regular` ولا الـ `VIP` ولا أي تفاصيل مادية.
- **الباراميتر `strategy`**: الميثود بتاخد باراميتر من نوع `DiscountStrategy` (الواجهة التجريدية). 
- **التنفيذ**: بتنادي على `strategy.calculateDiscount(originalPrice)`. هنا بيحصل الـ **Polymorphism**؛ وقت التشغيل (Runtime)، لو باصيت ليها كائن `VipDiscount` هيشتغل كود الـ VIP، ولو باصيت ليها `ScholarshipDiscount` هيشتغل كود المنح. الكود بتاع الكلاس ده ثابت ومش هيتغير للأبد، مع إنه يقدر يتعامل مع ملايين الخصومات الجديدة!

---

## 4. نقطة التشغيل `main()`

```dart
void main() {
  final calculator = DiscountCalculator();

  final regular = calculator.calculate(1000, RegularDiscount());
  final vip = calculator.calculate(1000, VipDiscount());
  final staff = calculator.calculate(1000, StaffDiscount());
  ...
}
```
- بننشئ كائن المحاسب مرة واحدة.
- لما نيجي نحسب الخصم، بنباصي السعر والـ Strategy اللي إحنا عايزينها (زي `RegularDiscount()`).
- لاحظ إزاي شغلنا `StaffDiscount` اللي عملناه جديد من غير ما نغير أي حرف في ملف `DiscountCalculator` الحساس. ده قمة الأمان وسلاسة الكود!


</div>