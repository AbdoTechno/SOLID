# Non-compliant Design Explanation (Bad Design)

In [bad.dart](code/bad.dart), the example illustrates a design that violates the Open-Closed Principle (OCP).

---

## Core Problem Analysis

In the `DiscountCalculator` class, the `calculateDiscount` method accepts the original price and a `StudentType` enum. The method uses a `switch` statement to determine the specific discount amount for each category:

```dart
switch (type) {
  case StudentType.regular: return originalPrice * 0.10;
  case StudentType.vip: return originalPrice * 0.20;
  case StudentType.scholarship: return originalPrice * 0.50;
}
```

The design flaw here is that **the class is open for modification and closed for extension**, which directly violates the core of the principle.

---

## Maintenance Issues

1. **Forced Modifications for New Categories**:
   If the university decides to introduce a new discount for university staff (35% discount) or international students (15% discount), we are forced to:
   - Modify the `StudentType` enum to add the new values.
   - Modify the `DiscountCalculator` class to add new `case` statements inside the `switch` block.
   - Modifying stable, running code in this manner risks introducing regression bugs.

2. **Spaghetti Code and Complexity**:
   While the `switch` statement looks simple with one-line return statements in this example, production grading and discount calculations are often highly complex (involving DB queries, eligibility audits, etc.). As the types of students increase, this single method will grow into a massive, unreadable conditional block.

3. **Complex Regression Testing**:
   With every new student category introduced, we must re-test the entire `DiscountCalculator` class to ensure that previously tested calculations (regular, VIP, scholarship) were not broken by the new code changes.