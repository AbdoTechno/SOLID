// كود نظيف ومتصلح بناءً على مبدأ الـ OCP
// لو حابين نضيف أي نوع خصم جديد، هنعمل كلاس جديد ونعمل Implement للـ DiscountStrategy من غير ما نلمس الكود القديم!

// 1. التجريد (Abstraction)
abstract class DiscountStrategy {
  double calculateDiscount(double originalPrice);
}

// 2. تطبيق الخصومات المختلفة (Concrete Strategies)
class RegularDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.10; // 10%
  }
}

class VipDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.20; // 20%
  }
}

class ScholarshipDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.50; // 50%
  }
}

// إضافة خصم جديد تماماً (مثلاً لموظفي الجامعة) من غير ما نغير أي كلاس قديم!
class StaffDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.35; // خصم 35% للموظفين
  }
}

// 3. كلاس الحساب الرئيسي (مغلق تماماً للتعديل ومفتوح للتمديد)
class DiscountCalculator {
  double calculate(double originalPrice, DiscountStrategy strategy) {
    return strategy.calculateDiscount(originalPrice);
  }
}

void main() {
  print('--- تشغيل كود حساب الخصم النظيف (Good OCP Example) ---');
  final calculator = DiscountCalculator();

  final regular = calculator.calculate(1000, RegularDiscount());
  final vip = calculator.calculate(1000, VipDiscount());
  final scholarship = calculator.calculate(1000, ScholarshipDiscount());
  final staff = calculator.calculate(1000, StaffDiscount()); // اشتغل من غير ما نعدل كلاس المحاسب!

  print('خصم الطالب العادي: $regular جنيه');
  print('خصم الطالب الـ VIP: $vip جنيه');
  print('خصم طالب المنحة: $scholarship جنيه');
  print('خصم الموظف الجديد: $staff جنيه');
}
