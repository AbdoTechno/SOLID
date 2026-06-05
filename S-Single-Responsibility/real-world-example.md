# Real-World Examples of the Single Responsibility Principle

The Single Responsibility Principle (SRP) is highly relevant in both software architecture and daily life. Below are five illustrative examples:

---

## 1. Flutter Framework Example (UI vs. Business Logic)

* **Non-compliant Design (Bad Design)**:
  Creating a Widget class (e.g., `UserScreen`) that contains an HTTP network request within its `build` method, parses the response, updates widget states, manages errors, and triggers popup alerts. This combines UI, business logic, networking, and error handling in a single component.
* **Compliant Design (SRP)**:
  - **`UserScreen` class (UI)**: Responsible only for rendering the user interface and delegating user interactions.
  - **`UserViewModel` or `UserCubit` (State Management)**: Manages screen states and coordinates background requests.
  - **`UserRepository` or `UserService` (Network/Persistence)**: Handles raw HTTP requests and database read/writes.
  - **`UserSerializer` (Data Mapping)**: Converts raw data (e.g., JSON) to typed Dart models.

---

## 2. Hospital Management System

* **Non-compliant Design (Bad Design)**:
  A `Doctor` class containing doctor profile attributes, patient visit schedules, salary calculation logic (based on consultations and surgeries), and medical report generation logic to export files as PDFs.
* **Compliant Design (SRP)**:
  - **`Doctor` class**: Represents the doctor's profile and medical specialty.
  - **`DoctorScheduler` class**: Manages doctor schedules, shift rosters, and patient appointments.
  - **`PayrollCalculator` class**: Calculates financial dues, doctor cuts, and monthly salaries.
  - **`MedicalReportGenerator` class**: Handles formatting and exporting patient reports to PDF format.

---

## 3. Banking System

* **Non-compliant Design (Bad Design)**:
  A `BankAccount` class holding account data and balance, processing deposits/withdrawals, calculating annual interest, and generating account statement files to send to customers via email.
* **Compliant Design (SRP)**:
  - **`BankAccount` class**: Stores only the account's unique identifier, balance, owner, and active status.
  - **`TransactionManager` class**: Validates and executes deposits, withdrawals, and bank transfers safely.
  - **`InterestCalculator` class**: Calculates yearly interest rates and updates account balances.
  - **`StatementGenerator` class**: Compiles transaction logs, formats bank statements, and handles exports.

---

## 4. Delivery Application

* **Non-compliant Design (Bad Design)**:
  An `Order` class holding order items and customer information, calculating delivery distance fees, connecting to Firebase to send push notifications, and calling Stripe APIs to process electronic transactions.
* **Compliant Design (SRP)**:
  - **`Order` class**: Represents the order data model containing items, total amount, and delivery details.
  - **`DeliveryPricingCalculator` class**: Calculates delivery fees based on distance, time, traffic, and weather.
  - **`NotificationService` class**: Handles sending push notifications, SMS, or emails to the customer.
  - **`PaymentProcessor` class**: Manages online transactions and integrates with third-party APIs like Stripe.

---

## 5. Restaurant Operations

* **Non-compliant Design (Bad Design)**:
  A `Chef` class containing methods for cooking dishes, washing pots, cleaning the kitchen area, calculating the budget, and purchasing raw materials from the market.
* **Compliant Design (SRP)**:
  - **`Chef` class**: Focuses solely on preparing and cooking food items.
  - **`KitchenStaff` class**: Manages pot washing and kitchen cleanliness.
  - **`InventoryManager` class**: Manages stock levels, kitchen budgets, and orders ingredients from suppliers.