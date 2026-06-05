# Non-compliant Design Explanation (Bad Design)

In [bad.dart](code/bad.dart), the `Student` class is a textbook example of a design that violates the Single Responsibility Principle (SRP).

---

## Core Problem Analysis

The `Student` class takes on multiple responsibilities that do not fall under its primary domain. These responsibilities are:
1. **Managing Core Student Data**: Holding the student's name, email, and enrolled courses (this is its only valid primary responsibility).
2. **Database Persistence**: Managing database connection details and save logic (which should belong to a database infrastructure class).
3. **Notification/Email Services**: Managing connection details to mail servers and formatting email messages (which should belong to an independent notification service).

---

## Future Problems

Adopting this non-compliant design in a production environment leads to several major issues:

1. **Fragile Database Changes**: 
   If the organization decides to switch the database system (for instance, from SQL to MongoDB), we are forced to open the `Student` class and modify the `saveToDatabase` method. Mixing database details with core business logic risks introducing bugs into unrelated student behavior whenever the storage infrastructure is updated.

2. **Fragile Notification Changes**:
   If the email provider changes, or if we want to change the greeting format, we have to open the `Student` class and modify `sendWelcomeEmail`. Modifying a stable class for unrelated infrastructure changes threatens the stability of the entire system.

3. **Untestable Business Logic**:
   If we want to write a unit test for the course enrollment method `enrollInCourse` to verify its logic, the class forces a real connection to the database and mail servers. We would be forced to write complex mock implementations for networks and databases just to test a simple list insertion.

4. **Frequent Merge Conflicts**:
   If two developers work on different tasks—one updating the email template and the other optimizing database queries—both must modify the exact same file (`bad.dart`). This leads to severe merge conflicts when integrating changes via Git.