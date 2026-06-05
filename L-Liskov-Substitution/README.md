# Liskov Substitution Principle (LSP)

The Liskov Substitution Principle (LSP) is the third of the SOLID principles. It establishes logical rules and constraints for inheritance and polymorphism to guarantee system stability and predictability.

---

## What is LSP?

Formulated by computer scientist Barbara Liskov, the principle states: **"If S is a subtype of T, then objects of type T may be replaced with objects of type S without altering any of the desirable properties of the program."**

In simpler terms: **Derived classes (subclasses) must be substitutable for their base classes (parent classes) in any part of the system without affecting program behavior or causing unexpected crashes.**

The subclass must adhere to all the contracts and expected behaviors of the parent class. It should not disable, restrict, or break any behavior promised by the parent.

---

## Why it Exists?

In Object-Oriented Programming (OOP), inheritance is a powerful tool. However, developers sometimes fall into the trap of using inheritance strictly for "code reuse" between similar classes, without a true logical "Is-A" relationship.

For example, if we inherit a `Penguin` class from a `Bird` class, and the system assumes all birds can fly and calls the `fly()` method, the program will crash because penguins cannot fly. This arbitrary inheritance violates LSP and breaks the architectural expectations of the system.

---

## Problems it Solves

1. **Runtime Errors**: Prevents exceptions like `UnimplementedError` or `NullPointerException` that occur when a subclass disables an inherited method that is not appropriate for it.
2. **Arbitrary Type Checking**: Eliminates the need to write type-checking conditions such as `if (bird is Penguin)` to prevent calling certain methods, keeping the codebase clean and flexible.
3. **Unexpected Component Behavior**: Ensures consistent and predictable object behaviors across different parts of the application.

---

## Benefits

* **Predictable Code**: Enables developers to use polymorphism safely, knowing that any subclass will behave correctly without breaking the parent class's interface contract.
* **Interchangeability**: Allows subclasses to be swapped dynamically without modifying the consuming client code.
* **Easier Maintenance**: Avoids runtime exceptions caused by diverging behavior in derived classes.

---

## Drawbacks if Ignored

* **Frequent Runtime Crashes**: Caused by calling unsupported inherited methods that throw `UnimplementedError()`.
* **Pollution with Type Checks**: Code becomes cluttered with type-checking statements like `if (entity is Subtype)`, which indirectly violates the Open-Closed Principle (OCP).

---

## Relation to other SOLID Principles

* **Open-Closed Principle (OCP)**: LSP is the engine that makes OCP successful. While OCP guides us to use abstraction for extending features, LSP ensures that new subclasses conform to the original abstract expectations without breaking the client logic.
* **Interface Segregation Principle (ISP)**: When subclasses are forced to violate LSP because the parent class contains methods they do not support, the solution is to apply ISP by splitting the bloated parent interface into smaller, specialized interfaces.