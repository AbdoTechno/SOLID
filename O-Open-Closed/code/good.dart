// Compliant code adhering to the Open-Closed Principle (OCP)
// To add any new discount type, we just create a new class implementing the DiscountStrategy interface without touching existing code.

// 1. Abstraction (Interface)
abstract class DiscountStrategy {
  double calculateDiscount(double originalPrice);
}

// 2. Concrete Strategies
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

// Adding a new discount strategy (e.g., for University Staff) without modifying any existing class!
class StaffDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.35; // 35% discount for university staff
  }
}

// 3. Main Calculator Class (Closed for modification, open for extension via polymorphism)
class DiscountCalculator {
  double calculate(double originalPrice, DiscountStrategy strategy) {
    return strategy.calculateDiscount(originalPrice);
  }
}

void main() {
  print('--- Running Compliant Code (Good OCP Example) ---');
  final calculator = DiscountCalculator();

  final regular = calculator.calculate(1000, RegularDiscount());
  final vip = calculator.calculate(1000, VipDiscount());
  final scholarship = calculator.calculate(1000, ScholarshipDiscount());
  final staff = calculator.calculate(1000, StaffDiscount()); // Works without modifying DiscountCalculator!

  print('Regular Student Discount: \$$regular');
  print('VIP Student Discount: \$$vip');
  print('Scholarship Student Discount: \$$scholarship');
  print('Staff Member Discount: \$$staff');
}
