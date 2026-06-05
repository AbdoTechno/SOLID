// Non-compliant code violating the Open-Closed Principle (OCP)
// If we want to add a new student type with a new discount, we must modify the main class and add a new case to the switch statement.

enum StudentType { regular, vip, scholarship }

class DiscountCalculator {
  // This method violates OCP because it is not closed for modification.
  double calculateDiscount(double originalPrice, StudentType type) {
    switch (type) {
      case StudentType.regular:
        return originalPrice * 0.10; // 10% discount for regular students
      case StudentType.vip:
        return originalPrice * 0.20; // 20% discount for VIP students
      case StudentType.scholarship:
        return originalPrice * 0.50; // 50% discount for scholarship students
    }
  }
}

void main() {
  print('--- Running Non-compliant Code (Bad OCP Example) ---');
  final calculator = DiscountCalculator();
  
  final regularDiscount = calculator.calculateDiscount(1000, StudentType.regular);
  final vipDiscount = calculator.calculateDiscount(1000, StudentType.vip);
  final scholarshipDiscount = calculator.calculateDiscount(1000, StudentType.scholarship);

  print('Regular Student Discount: \$$regularDiscount');
  print('VIP Student Discount: \$$vipDiscount');
  print('Scholarship Student Discount: \$$scholarshipDiscount');
}
