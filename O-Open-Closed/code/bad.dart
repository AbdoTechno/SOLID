// كود عك بيخالف مبدأ الـ OCP
// هنا لو حابين نضيف نوع طالب جديد بخصم جديد، هنضطر نعدل في الكلاس الرئيسي ونزود Case جديدة!

enum StudentType { regular, vip, scholarship }

class DiscountCalculator {
  // الميثود دي بتخالف الـ OCP بشكل صارخ!
  double calculateDiscount(double originalPrice, StudentType type) {
    switch (type) {
      case StudentType.regular:
        return originalPrice * 0.10; // خصم 10% للطلاب العاديين
      case StudentType.vip:
        return originalPrice * 0.20; // خصم 20% للطلاب الـ VIP
      case StudentType.scholarship:
        return originalPrice * 0.50; // خصم 50% لطلاب المنح الدراسية
    }
  }
}

void main() {
  print('--- تشغيل كود حساب الخصم العك (Bad OCP Example) ---');
  final calculator = DiscountCalculator();
  
  final regularDiscount = calculator.calculateDiscount(1000, StudentType.regular);
  final vipDiscount = calculator.calculateDiscount(1000, StudentType.vip);
  final scholarshipDiscount = calculator.calculateDiscount(1000, StudentType.scholarship);

  print('خصم الطالب العادي: $regularDiscount جنيه');
  print('خصم الطالب الـ VIP: $vipDiscount جنيه');
  print('خصم طالب المنحة: $scholarshipDiscount جنيه');
}
