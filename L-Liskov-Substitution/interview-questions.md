# Technical Interview Questions on the Liskov Substitution Principle (LSP)

A collection of technical interview questions and answers regarding the Liskov Substitution Principle (LSP), categorized by professional experience level:

---

## Junior Level

### Q1: What is the Liskov Substitution Principle (LSP) in simple terms?
**Answer**: LSP states that subclasses must be substitutable for their parent (base) classes. The system must run correctly and predictably without any crashes or modifications when child class objects replace parent class objects.

### Q2: Who formulated this principle and why is it named "Liskov"?
**Answer**: The principle is named after Barbara Liskov, a prominent computer scientist who introduced it in a 1987 conference keynote address.

### Q3: What is the most common red flag indicating that a subclass violates LSP?
**Answer**: Overriding a method inherited from the parent class and throwing a runtime exception (such as `UnimplementedError` or `UnsupportedOperationException`) to disable that behavior because it doesn't apply to the subclass.

### Q4: Can a subclass change the return type of an inherited method?
**Answer**: Generally, no. Subclasses must return the same type or a subtype of the return type declared by the parent class. In addition to technical type matching, LSP also requires semantic consistency: the subclass method must behave according to the logical expectations of the parent's contract.

### Q5: Explain the classic Square-Rectangle problem.
**Answer**: Mathematically, a square is a special type of rectangle. However, if we inherit `Square` from `Rectangle`, we break LSP. A `Rectangle` has independent width and height properties. Changing the width of a rectangle does not alter its height. A `Square` forces width and height to change together. If client code changes the width of a `Rectangle` reference and calculates its area, it will get incorrect math if a `Square` instance is passed in.

### Q6: If a parent method accepts integers from 1 to 100, and a subclass overrides it to only accept 1 to 50, does this violate LSP?
**Answer**: Yes, this violates LSP. The subclass is strengthening pre-conditions. The client code is built to expect a valid input range up to 100. If it passes 80 to a subclass instance, the subclass will fail or throw an exception, breaking substitution safety.

### Q7: What does the "Duck Test" mean in the context of LSP?
**Answer**: "If it looks like a duck and quacks like a duck but needs batteries to run, you have the wrong abstraction." In programming, this means mimicking a class signature superficially while failing to implement its core behaviors indicates an invalid inheritance model.

---

## Mid-Level

### Q8: How can you resolve an LSP violation caused by `UnimplementedError` exceptions?
**Answer**: By refactoring the inheritance hierarchy. Extract the unsupported method from the base class and move it to a separate abstract interface or an intermediate class. Only the subclasses that actually support this behavior should implement the new interface.

### Q9: What are pre-conditions and post-conditions in the context of LSP?
**Answer**:
- **Pre-conditions**: Conditions that must be true before a method runs. A subclass cannot make these conditions stricter or harder to fulfill.
- **Post-conditions**: Conditions that must be true after a method completes. A subclass cannot weaken these guarantees; it must return results that match or exceed the parent's promises.

### Q10: How does adhering to LSP reduce type-checking blocks?
**Answer**: LSP guarantees behavioral consistency. When a developer is confident that any subclass executes the parent methods safely, they do not need to write type checks like `if (student is RegularStudent)`. This results in cleaner, polymorphically sound code.

### Q11: Does LSP forbid method overriding?
**Answer**: No. Method overriding is the foundation of polymorphism. LSP only forbids overrides that change the semantic meaning or break the expected logical outcomes of the parent's contract.

### Q12: What is "Inheritance for Code Reuse" and why is it dangerous?
**Answer**: It is the practice of inheriting class B from class A just to reuse some of A's methods, even though there is no logical "Is-A" relationship. This forces subclass B to inherit methods it does not support, leading to disabled methods, exceptions, and LSP violations.

### Q13: What is the recommended design alternative to arbitrary inheritance?
**Answer**: The golden rule is: **"Favor Composition over Inheritance"**. If you cannot guarantee a true "Is-A" relationship under all circumstances, embed an instance of the class as a field inside your new class instead of inheriting from it directly.

### Q14: If a base method returns a `List<String>`, can a subclass override it to return a `List<int>`?
**Answer**: No. Changing type parameters to an incompatible type breaks type safety and violates LSP. The subclass must return the exact type or a subtype (Covariance) of the parent's return type to keep client code compiling and executing safely.

---

## Senior Level

### Q15: Explain Covariance and Contravariance in the context of LSP.
**Answer**:
- **Covariance**: Relates to return types. A subclass method can return a more specific subtype than what is declared in the parent method.
- **Contravariance**: Relates to method parameters. A subclass method should logically accept a more generic supertype for its parameters to broaden input capabilities.
Modern type systems enforce covariance for return values, but typically enforce strict invariance (exact type match) for parameters to keep the compiler checks stable and simple.

### Q16: How do you design API Contracts to guarantee LSP compliance?
**Answer**: We write strict interface specifications and run Contract Tests. Subclasses are subjected to the exact same suite of unit tests as the base class to verify that they conform to the pre-conditions, post-conditions, and expected behavior invariants.

### Q17: Are there any famous LSP violations in standard programming libraries?
**Answer**: Yes, in Java, `Collections.unmodifiableList()` returns an object that implements the standard `List` interface. However, calling `add()` on this list throws an `UnsupportedOperationException`. This is a classic LSP violation because the returned list cannot substitute for the base `List` interface without breaking client code that writes to lists.

### Q18: How do you apply "Design by Contract" (DbC) to enforce LSP?
**Answer**: DbC dictates that subclasses must:
1. Accept pre-conditions that are no stricter than the base class.
2. Guarantee post-conditions that are no weaker than the base class.
3. Maintain the base class invariants (core properties and states that must remain constant).
This is enforced using assertion statements and comprehensive test suites checking all derived classes.

### Q19: If you inherit a legacy project riddled with type-checking statements (`is` or `instanceof`), what is your refactoring plan?
**Answer**: We transition from inheritance to composition:
1. Identify subclasses that disable inherited methods and cause violations.
2. Extract the varying methods into small, specialized interfaces.
3. Clean the base class so it only contains methods supported by 100% of the subtypes.
4. Have subclasses implement only the interfaces they actually support.
5. Use the Factory Pattern to manage object creation and cover the refactored code with unit tests.

### Q20: How does LSP impact Aggregate design in Domain-Driven Design (DDD)?
**Answer**: In DDD, the Aggregate Root is responsible for protecting state invariants. Deep inheritance hierarchies inside an aggregate risk breaking these invariants because subclasses can manipulate internal fields in ways that violate business rules. Therefore, DDD discourages complex inheritance and favors Composition and Value Objects to protect the domain model's integrity.