# Real-World Examples of the Interface Segregation Principle

The Interface Segregation Principle (ISP) keeps APIs lean, cohesive, and easy to consume. Below are five practical examples illustrating its application in different software domains:

---

## 1. Flutter Framework Example (Text Fields and Formatting)

* **Non-compliant Design (Bad Design)**:
  Imagine if Flutter provided a single unified interface named `TextFieldHelper` containing all tasks for input fields: focus node handling, text formatting, copy-paste operations, and input validation. To create a simple text formatter that filters out numbers, developers would have to implement all these unrelated methods and leave them empty.
* **Compliant Design (ISP)**:
  Flutter splits these concerns into small, focused interfaces:
  - `TextInputFormatter`: Declares a single `formatEditUpdate()` method dedicated solely to modifying and formatting input text.
  - `FocusNode`: Manages only focus state and keyboard events.
  - `FormFieldValidator`: Defines the signature for input validation.
  This allows developers to implement `TextInputFormatter` independently to create a custom formatting class without bloating.

---

## 2. Hospital Management System (Medical Roles)

* **Non-compliant Design (Bad Design)**:
  Creating a global interface named `HospitalWorker` containing methods like: `performSurgery()`, `prescribeMedication()`, `administerInjection()`, and `cleanRooms()`.
  When a nurse or janitor implements this interface, they are forced to write empty overrides or throw exceptions for `performSurgery()` because that action belongs strictly to qualified surgeons.
* **Compliant Design (ISP)**:
  Segregate the global interface into dedicated interfaces:
  - `Surgeon`: Declares the `performSurgery()` method.
  - `Prescriber`: Declares the `prescribeMedication()` method.
  - `CareGiver`: Declares the `administerInjection()` method.
  - `SanitationWorker`: Declares the `cleanRooms()` method.

---

## 3. Banking System (ATM Services)

* **Non-compliant Design (Bad Design)**:
  Designing an interface named `AtmService` containing methods like: `withdrawCash()`, `depositCash()`, `transferMoney()`, `applyForLoan()`, and `updatePin()`.
  Standard, low-cost ATMs do not support loan applications from their physical terminals; therefore, implementing this class forces developers to throw exceptions when loan methods are invoked.
* **Compliant Design (ISP)**:
  - `BasicAtm`: Declares only basic services like withdrawals, deposits, and balance inquiries.
  - `AdvancedAtm` extends `BasicAtm` and adds fund transfers and PIN update methods.
  - `BankPortalService`: Dedicated to complex investment operations and loan applications through the bank's main web portal.

---

## 4. Delivery Application (Courier Services)

* **Non-compliant Design (Bad Design)**:
  A `Courier` interface containing methods like: `driveCar()`, `rideBike()`, `flyDrone()`, `collectCash()`, and `processCreditCard()`.
  A delivery rider using a bicycle cannot drive a car, and an autonomous delivery drone cannot collect cash payments from customers.
* **Compliant Design (ISP)**:
  - `RoadNavigator`: Handles route calculation and driving land vehicles.
  - `CashHandler`: For human couriers authorized to collect cash on delivery.
  - `DroneNavigator`: Declares navigation and flight controls for autonomous delivery drones.

---

## 5. Restaurant System (Employee Shifts)

* **Non-compliant Design (Bad Design)**:
  An interface named `Staff` containing methods like: `takeOrder()`, `prepareFood()`, `serveFood()`, `cleanTables()`, and `calculateBill()`.
  The waiter does not cook food, and the chef does not clean customer tables if the restaurant employs dedicated cleaning staff.
* **Compliant Design (ISP)**:
  - `OrderTaker`: For employees taking customer orders.
  - `FoodPreparer`: For chefs preparing and cooking meals.
  - `FoodServer`: For waitstaff serving dishes to customer tables.
  - `TableCleaner`: For sanitation staff cleaning tables.