# Real-World Examples of the Liskov Substitution Principle

The Liskov Substitution Principle (LSP) prevents the misuse of inheritance and ensures that derived classes maintain the behaviors and contracts of their parent classes. Below are five illustrative examples from software systems:

---

## 1. Flutter Framework Example (Scroll Controllers)

* **Non-compliant Design (Bad Design)**:
  Creating a custom class extending Flutter's base `ScrollController`. To change specific behaviors, the developer overrides the `jumpTo(double value)` method to throw an exception or ignore calls in certain scroll directions. When this custom controller is attached to a standard `ListView`, the application crashes internally because the Flutter framework assumes any instance of `ScrollController` supports the `jumpTo` action without throwing exceptions.
* **Compliant Design (LSP)**:
  If a custom controller cannot support the `jumpTo` behavior, it should not inherit from `ScrollController`. Instead, separate the scrolling listener behaviors, or write a dedicated controller that processes events independently without violating the parent class contracts.

---

## 2. Hospital Management System (Patient Room Allocations)

* **Non-compliant Design (Bad Design)**:
  A base class `Patient` contains an `assignToRoom(Room room)` method.
  An `Outpatient` class (a patient who visits the clinic and leaves the same day) extends `Patient`. Since outpatients do not stay overnight, the developer overrides `assignToRoom` to throw a `CannotAssignOutpatientToRoom` exception.
* **Compliant Design (LSP)**:
  - Base class `Patient`: Contains only common fields like name, ID, and medical history.
  - Intermediate class `Inpatient` extends `Patient` and includes the room allocation logic `assignToRoom()`.
  - Class `Outpatient` extends `Patient` directly and does not inherit the room allocation method at all.

---

## 3. Banking System (Credit Cards vs. Prepaid Cards)

* **Non-compliant Design (Bad Design)**:
  A parent class `BankCard` contains both `withdraw(double amount)` and `chargeOverdraft(double amount)` methods.
  A subclass `PrepaidCard` extends `BankCard`. Since prepaid cards do not support overdraft limits, the developer overrides `chargeOverdraft` to throw an exception or returns a dummy value that corrupts account statements.
* **Compliant Design (LSP)**:
  - Base class `BankCard`: Defines only the common cash withdrawal method `withdraw()`.
  - Subclass `CreditCard` extends `BankCard` and adds the overdraft limit feature `chargeOverdraft()`.
  - Subclass `PrepaidCard` extends `BankCard` and restricts withdrawals to the available prepaid balance.

---

## 4. Delivery Application (Delivery Vehicles & Refueling)

* **Non-compliant Design (Bad Design)**:
  A base class `DeliveryVehicle` contains a `refuelGasoline()` method.
  A subclass `ElectricBike` extends `DeliveryVehicle`. Since electric bikes run on batteries and do not use gasoline, the developer overrides `refuelGasoline()` to throw a `NotSupported` exception.
* **Compliant Design (LSP)**:
  - Base class `DeliveryVehicle`: Contains only common operational signatures like `startEngine()` or `move()`.
  - Subclass `GasolineVehicle` extends `DeliveryVehicle` and adds the `refuelGasoline()` method.
  - Subclass `ElectricVehicle` extends `DeliveryVehicle` and adds the `chargeBattery()` method.

---

## 5. Restaurant System (Menu Items & Preparation)

* **Non-compliant Design (Bad Design)**:
  A parent class `MenuItem` contains a `cook()` method.
  A subclass `SoftDrink` extends `MenuItem`. Since soft drinks do not require cooking, the developer overrides `cook()` as an empty block or throws a runtime exception.
* **Compliant Design (LSP)**:
  - Base class `MenuItem`: Stores only shared properties like name, price, and description.
  - Subclass `CookedItem` extends `MenuItem` and adds the `cook()` method.
  - Subclass `Beverage` extends `MenuItem` and adds the `chill()` method.