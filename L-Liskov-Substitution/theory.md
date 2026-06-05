# Theoretical Explanation of the Liskov Substitution Principle

The Liskov Substitution Principle (LSP) provides the logical rules and guidelines for applying inheritance correctly to prevent runtime crashes in software execution.

---

## Mental Model and Analogy

To understand this principle, consider the famous **"Duck Test"** in software engineering:
> "If it looks like a duck, quacks like a duck, but needs batteries to function, you probably have the wrong abstraction."

Suppose we create a `ToyDuck` class and inherit it from the main `Duck` class simply because they share visual properties. A problem arises when the system processes ducks and attempts to call `swim()` or `eat()`. The `ToyDuck` will fail and throw an exception because its actual behavior does not align with the functional promises of a real duck.

Correct inheritance is not based on superficial visual similarity. It requires **exact alignment in behavioral expectations and contract promises**.

---

## Origin of the Principle

When Barbara Liskov formulated this principle in 1987, she defined strict mathematical rules to govern parent-child class relationships. Developers discovered that compiler rules allowed technical inheritance of any class from another (such as inheriting a `Car` class from a `Bicycle` class because they are both vehicles) without enforcing logical consistency, which led to unexpected runtime exceptions.

To address this, LSP introduces two primary guidelines:
1. **Contract Invariants**: The subclass must respect the pre-conditions and post-conditions defined by the parent class. It cannot strengthen pre-conditions (make it harder to call methods) or weaken post-conditions (guarantee less output).
2. **Behavioral Invariants**: The subclass must not alter the core business meaning or logical side-effects of the parent's methods in a way that breaks client expectations.

---

## Misconceptions and Common Mistakes

1. **Throwing UnimplementedError**:
   Some developers create a subclass and disable inherited methods that do not apply to it by throwing exceptions:
   `throw UnimplementedError("This method is not supported in this subclass.")`
   This is a direct violation of LSP. If the client code invokes this method expecting a valid subtype to execute it, the application crashes immediately.

2. **The Classic Square-Rectangle Problem**:
   Mathematically, a square is a rectangle with equal sides. However, in OOP design, if we inherit `Square` from `Rectangle`:
   - The `Rectangle` class allows setting the width and height independently.
   - The `Square` class must force width and height to change together to maintain a square's proportions.
   - If client code executes:
     `rectangle.setWidth(5); rectangle.setHeight(10);`
     and the passed object is a `Square`, the calculated area will be incorrect and break the mathematical expectations of the client, violating LSP.

---

## Practical Understanding

To verify if your code complies with LSP:
- **Analyze Subtype Promises**: Can the subclass fulfill all parent class promises with the same logic and guarantees?
- **Avoid Frequent Runtime Type Checks**: If you find yourself writing type checks like:
   `if (employee is Manager) { employee.calculateBonus(); }`
   the inheritance model is flawed. You should define the method in the parent class (e.g., returning zero for standard employees) or break the structure into separate interfaces.
- **Favor Composition over Inheritance**: When in doubt about whether S truly "Is-A" T, use composition (putting T as a field inside S) instead of direct subclassing.