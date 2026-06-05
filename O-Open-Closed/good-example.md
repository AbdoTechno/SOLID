# Compliant Design Explanation (Good Design)

In [good.dart](code/good.dart), we resolved the tight coupling issues and switch-statement dependency by utilizing **Abstraction** and **Polymorphism**:

---

## New Solution Structure

1. **Unifying Interface (`DiscountStrategy`)**:
   We created an abstract class named `DiscountStrategy` containing a single abstract method, `calculateDiscount`. This class acts as the standard interface that governs all discount calculations in the system.

2. **Isolating Each Category into a Dedicated Class**:
   - The `RegularDiscount` class implements the interface to compute regular student discounts (10%).
   - The `VipDiscount` class implements the interface to compute VIP student discounts (20%).
   - The `ScholarshipDiscount` class implements the interface to compute scholarship student discounts (50%).

3. **Calculator Depends on Abstraction**:
   The `DiscountCalculator` class is now decoupled from the details of specific student types and their mathematical formulas. It simply accepts the original price and any instance implementing the `DiscountStrategy` interface:
   ```dart
   double calculate(double originalPrice, DiscountStrategy strategy) {
     return strategy.calculateDiscount(originalPrice);
   }
   ```

---

## Extensibility Advantages

* **Simple Extension for New Categories**:
   If we need to add a staff discount (35%), we simply create a new class implementing the `DiscountStrategy` interface without touching existing files:
   ```dart
   class StaffDiscount implements DiscountStrategy {
     @override
     double calculateDiscount(double originalPrice) => originalPrice * 0.35;
   }
   ```
   And consume it in the main method as follows:
   ```dart
   calculator.calculate(1000, StaffDiscount());
   ```
   Notice that we did not open `DiscountCalculator` or edit its contents. The code is 100% closed for modification and open for extension.

* **Encapsulated Logic**:
   The calculation rules for each discount type are isolated within their own classes. If a bug is found in VIP discount calculations, we resolve it within `VipDiscount` without worrying about affecting the `RegularDiscount` calculations.