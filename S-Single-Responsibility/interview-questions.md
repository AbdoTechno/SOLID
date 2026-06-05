# Technical Interview Questions on the Single Responsibility Principle (SRP)

A collection of technical interview questions and answers regarding the Single Responsibility Principle (SRP), categorized by professional experience level:

---

## Junior Level

### Q1: What is the Single Responsibility Principle (SRP)?
**Answer**: SRP is the first principle of SOLID. It states that a class or module should specialize in executing one specific function in the system, meaning it should have one, and only one, reason to change.

### Q2: What problems arise from creating a single massive class that handles all tasks (a God Class)?
**Answer**: A God Class increases code complexity, making it difficult to read, maintain, and refactor. Modifying one part can cause unexpected side effects in unrelated areas. It also increases the probability of merge conflicts when multiple developers work on the same file.

### Q3: Does SRP require a class to have only a single method?
**Answer**: No. A class can have multiple methods as long as they all serve the same single responsibility or business concept (e.g., a database access class can have methods for saving, deleting, and updating records, as they all serve user storage).

### Q4: How can you detect that a class violates SRP?
**Answer**: Look at how you describe the class's purpose. If you use conjunctions like "and" to explain what it does (e.g., "It fetches data, **and** parses it, **and** saves it to DB, **and** prints logs"), the class is violating SRP.

### Q5: What is the relationship between SRP and Unit Testing?
**Answer**: Structuring code according to SRP makes writing unit tests straightforward and focused. You can test each class in isolation without needing complex mock objects for unrelated dependencies.

### Q6: If an `Invoice` class calculates invoice amounts and exports them as PDFs, is this design SRP-compliant?
**Answer**: No. Calculating invoice amounts is business logic, while exporting PDFs is a presentation concern. The correct design splits this into two classes: `Invoice` for financial calculations, and `InvoicePdfPrinter` to handle PDF generation.

### Q7: What does the term "Actor" mean in the context of SRP?
**Answer**: An "Actor" refers to a specific user, department, or business role that requests changes in the software requirements. SRP directs that a class should serve only one actor to avoid conflicting requirements overlapping in the same file.

---

## Mid-Level

### Q8: How would you refactor legacy code that violates SRP?
**Answer**: First, analyze the class and identify the sources of change requests (Actors). If the class is modified due to UI layout updates and database schema updates, extract the persistence logic into a repository class and the layout logic into a view class, leaving the original class to act as a lightweight coordinator if necessary.

### Q9: What is the difference between SRP and Separation of Concerns (SoC)?
**Answer**: SoC is a high-level architectural pattern focused on dividing the system into logical layers (e.g., Presentation, Domain, Data). SRP is a class-level design principle ensuring that individual classes and modules within those layers have a single, highly-focused responsibility.

### Q10: Doesn't dividing code into small classes increase the number of files and make tracing difficult?
**Answer**: It does increase the file count, but organizing them within clear folder structures makes them much easier to manage, review, and test compared to wading through a single file containing thousands of tangled lines of code.

### Q11: In a Flutter application, should input validation be handled inside the Widget class?
**Answer**: The Widget (UI) should only handle simple syntactic checks (like verifying a field isn't empty). Business validation logic (like checking if an email is already registered) belongs to the business logic layer (e.g., Bloc, Cubit, or Controller) to adhere to SRP.

### Q12: If a `User` data model contains `toJson()` and `fromJson()` methods, does it violate SRP?
**Answer**: Academically, yes, since serialization is a separate concern. Practically, however, this is a widely accepted exception (Data Transfer Object pattern) because these methods only serialize the internal properties of the class itself and do not contain complex networking or mapping logic.

### Q13: How should utility classes (Utility Classes) be structured under SRP?
**Answer**: Instead of creating a single generic `Utils` class containing mixed functions, create specialized utility classes such as `DateFormatter` for date operations, `CurrencyConverter` for financial formats, and `MathHelper` for mathematical operations.

### Q14: What are the warning signs (Red Flags) indicating that a class needs to be refactored?
**Answer**:
1. High line count and massive file size.
2. A large list of unrelated import statements.
3. Difficulty finding a simple, descriptive name for the class.
4. Low cohesion: different methods utilizing completely different subsets of class instance variables.

---

## Senior Level

### Q15: How does SRP apply to Microservices Architecture?
**Answer**: SRP is the guiding philosophy behind microservices. Each service should focus on a single business capability (e.g., Payment Service, Notification Service). If a single service handles multiple domain boundaries, it turns the architecture into a "Distributed Monolith," which is highly complex and fragile.

### Q16: Explain Cohesion and its relationship to SRP.
**Answer**: Cohesion measures how closely related the methods and variables within a class are. SRP aims for High Cohesion, meaning all class members work together to achieve a single task. Low cohesion indicates the class is trying to do too much and should be split.

### Q17: How do you balance SRP with the Common Closure Principle (CCP)?
**Answer**: CCP states that classes that change together should be packaged together. We achieve balance by separating distinct responsibilities into dedicated classes (SRP), while grouping related classes that serve the same domain under the same package or module (CCP) to simplify release management.

### Q18: Can over-applying SRP lead to an Anemic Domain Model? How do you avoid it?
**Answer**: Yes. If you strip domain entities of all logic and move it entirely to service classes, the entities become mere data containers (Anemic Domain Model). To avoid this, keep core domain rules and validations that govern the entity's internal state within the entity class, and only extract external dependencies (like DB queries or API requests) to external services.

### Q19: If you find code that works correctly but violates SRP during a Pull Request, what is your approach?
**Answer**: Explain the architectural risks of the tight coupling (e.g., regression bugs during updates, lack of testability), and provide a concrete refactoring suggestion showing how splitting the class improves future maintenance and unit testing.

### Q20: How does the Dependency Inversion Principle (DIP) support SRP?
**Answer**: DIP decouples SRP-compliant classes by allowing them to communicate via abstract interfaces rather than concrete implementations. This ensures that changing the implementation of one specialized class does not require modifying the class that consumes it.