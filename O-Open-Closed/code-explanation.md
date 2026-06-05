# Code Explanation Line-by-Line

A detailed explanation of the compliant software design implemented in [good.dart](code/good.dart):

---

## 1. Abstraction

```dart
abstract class DiscountStrategy {
  double calculateDiscount(double originalPrice);
}
```
- **`abstract class`**: An abstract class cannot be instantiated directly. Its purpose is to define a standard interface and establish a contract that all concrete subclasses must fulfill.
- **`calculateDiscount` method**: An abstract method without a body. It only declares the method name, parameter signature, and return type (`double`). Any class implementing this interface is obligated to write the execution details of this method.

---

## 2. Concrete Strategies

```dart
class RegularDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double originalPrice) {
    return originalPrice * 0.10; // 10% discount
  }
}
```
- **`implements DiscountStrategy`**: Indicates that `RegularDiscount` promises to implement the abstract interface and provide the specific calculation rules for regular student discounts.
- **`@override`**: A Dart compiler annotation indicating that this method overrides the definition declared in the parent interface.
- **Calculation Logic**: Multiplies the original price by `0.10` to return a 10% discount. The same structure is used in `VipDiscount` (20%) and `ScholarshipDiscount` (50%) with different rates.

---

## 3. The Calculator Class

```dart
class DiscountCalculator {
  double calculate(double originalPrice, DiscountStrategy strategy) {
    return strategy.calculateDiscount(originalPrice);
  }
}
```
- This class is the core of our OCP design: `DiscountCalculator` is completely decoupled from individual discount subclasses.
- **`strategy` parameter**: The `calculate` method accepts a parameter typed as the abstract interface `DiscountStrategy`.
- **Dynamic Dispatch**: When calling `strategy.calculateDiscount(originalPrice)`, the system uses **Polymorphism** to resolve the correct subclass calculation logic at runtime. If a `VipDiscount` is passed, the VIP formula runs. The source code of `DiscountCalculator` remains static and closed for modification, yet open to supporting any new strategy.

---

## 4. Main Entry Point `main()`

```dart
void main() {
  final calculator = DiscountCalculator();

  final regular = calculator.calculate(1000, RegularDiscount());
  final vip = calculator.calculate(1000, VipDiscount());
  final staff = calculator.calculate(1000, StaffDiscount());
  ...
}
```
- We instantiate `DiscountCalculator` once.
- To calculate a discount, we pass the original price along with the specific strategy instance (e.g., `RegularDiscount()`).
- The code demonstrates how the newly introduced `StaffDiscount` works seamlessly without modifying the `DiscountCalculator` class, proving the design is open for extension and closed for modification.