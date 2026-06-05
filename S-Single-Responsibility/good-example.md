# Compliant Design Explanation (Good Design)

In [good.dart](code/good.dart), we resolved the bloated class problem by separating responsibilities into three independent, specialized classes:

---

## New Structure and Separation of Responsibilities

1. **`Student` class**: 
   Only represents and manages the core attributes and state of a student (ID, name, email, and enrolled courses list). It contains zero details about database infrastructure or email services, making it clean and focused.

2. **`StudentRepository` class**:
   Acts as the data access/persistence layer. It accepts a student object and manages saving it. If the storage mechanism or database provider changes, only this class is modified, leaving the rest of the application untouched.

3. **`EmailService` class**:
   Manages network communication and notifications. It is dedicated to sending welcome emails. If the email template changes or we switch to a different SMTP server, modifications are restricted to this class.

---

## Acquired Benefits

* **Safe and Decoupled Modifications**: 
   When changing database engines, we modify `StudentRepository` safely without editing the `Student` class. The business logic of course enrollment remains protected.

* **Simplified Unit Testing**:
   To test student enrollment logic, we can test the `Student` class directly. We no longer need to mock complex database repositories or email servers, making tests execute in milliseconds.

* **Reduced Code Conflicts**:
   Dividing tasks across separate files means developers can work on different tasks simultaneously. A developer optimizing database connections modifies `StudentRepository.dart`, while another editing the email format works on `EmailService.dart`. Git merges are resolved automatically.

* **High Extensibility**:
   If we need to send SMS notifications instead of or in addition to emails, we can introduce an `SmsService` class without modifying the `Student` or `StudentRepository` classes.