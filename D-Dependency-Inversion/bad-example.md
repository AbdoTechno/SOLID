# Analysis of the Bad Design: bad-example.md

In the code file [bad.dart](file:///d:/Ai_student/Second%20Term/Design%20patterns/SOLID/D-Dependency-Inversion/code/bad.dart), this example demonstrates the issue of direct dependency and tight coupling, and how it negatively affects system flexibility.

---

## Technical Problem Analysis

The `StudentEnrollmentSystem` class is a high-level module because it contains the core business logic for managing student enrollments.
Conversely, the `MySqlDatabase` class is a low-level module because it handles infrastructure details, specifically database connectivity and data storage.

In this bad design, the developer made two key mistakes:
1. The business logic class directly depends on the concrete `MySqlDatabase` class:
   `late final MySqlDatabase _database;`
2. The database object is instantiated directly inside the constructor:
   `_database = MySqlDatabase();`

This approach tightly couples the enrollment logic to MySQL databases exclusively.

---

## Resulting Maintenance Issues

1. **Difficulty Swapping Data Storage Technologies**:
   If the university decides to migrate its data store to another database engine (like MongoDB) to improve performance or scalability, we are forced to:
   - Open the business logic class `StudentEnrollmentSystem`.
   - Replace the `MySqlDatabase` type with `MongoDatabase`.
   - Modify the instantiation code inside the constructor.
   - Update the methods that call save/read operations.
   This violates the Open-Closed Principle (OCP) because we must modify stable business logic just to change a low-level implementation detail, risking new bugs in the core system.

2. **Difficulty Running Unit Tests**:
   To test the `enrollStudent` method, it is forced to establish a real connection to the MySQL database and write mock records to a physical database:
   - If the database server is offline, the test will fail even if the business logic code is completely correct.
   - Tests run much slower due to physical database communication.
   - We cannot mock the database layer because the business logic class instantiates its dependency internally, preventing us from injecting a mock object.