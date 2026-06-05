# Theoretical Explanation of the Single Responsibility Principle

To understand the Single Responsibility Principle (SRP) accurately, it is helpful to start with a real-life analogy before diving into the programming details.

---

## Mental Model and Analogy

Consider a **Student Affairs** department in a university where a single employee handles all tasks: receiving applications, searching the paper archives, obtaining signatures from the dean, collecting tuition fees, preparing drinks, and locking up the office at night.

If this employee goes on sick leave, the entire department stops working. Moreover, if the payment collection method changes (e.g., transitioning from cash payments to electronic payments), the employee must adapt to the new procedure, disrupting their other core tasks like searching the archive.

In software, this employee is what we call a **"God Class"**—a class that carries the weight of the entire system.
A correct design divides these tasks among an archivist, a cashier, and a public relations officer. With this division, if the payment method changes, the modification is confined to the cashier, while the archivist continues working uninterrupted.

---

## Origin of the Principle

When Robert C. Martin (Uncle Bob) formulated this principle, he focused on identifying who requests the change: **"Who triggers the change?"**
He defined a responsibility as: **"A group of people or departments that share the same needs"** (Actors).

For example, if a single class serves the Finance department, HR department, and Reporting department at the same time, this class has three distinct reasons to change (3 Actors). When HR requests a modification, we are forced to modify this class, which is risky because the HR update might accidentally break a feature used by the Finance department.

---

## Misconceptions and Common Mistakes

1. **Believing that "a single responsibility means a single method"**:
   This is a common error; some believe they must create a separate class for every single function (method). The principle does not require this; rather, it directs that a class should serve a single actor or a single business concept.
   *Example*: A `UserRepository` class containing methods like `saveUser()`, `deleteUser()`, `updateUser()`, and `getUserById()`. Even though there are multiple methods, they all serve a single specific responsibility: **Managing database operations for users**. This design is fully SRP-compliant.

2. **Over-Engineering (Interface Explosion)**:
   Dividing code into extremely small classes and files without justification makes tracking and understanding the business logic difficult. You must maintain a balance by asking: "If this code changes, who benefits and who might be affected?" If only one business actor is affected, the design is solid.

---

## Practical Understanding

To evaluate a class against SRP, try describing its role in a single simple sentence. If you find yourself using the conjunction **"and"** repeatedly, it is a sign of poor design.
*Example*:
- "This class fetches user data from the server, **and** parses it, **and** stores it in the local database, **and** displays it on the screen, **and** sends a welcome email."
This description indicates that each of these tasks should be separated into its own dedicated class.
- *Correct Design*: "This class is only responsible for displaying user data on the screen," while other operations are handled by independent background services.