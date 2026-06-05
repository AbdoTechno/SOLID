# Real-World Examples of the Open-Closed Principle

The Open-Closed Principle (OCP) is widely used in designing highly scalable, modular systems. Below are five practical examples demonstrating its application in software projects:

---

## 1. Flutter Framework Example (Customizable Widgets)

* **Non-compliant Design (Bad Design)**:
  Creating a `CustomButton` widget that contains a `switch` statement based on a button type parameter. If the type is `google`, it renders the Google logo and matches Google's colors; if the type is `facebook`, it changes layout colors and icons, and so on. If we want to add login via `GitHub`, we must modify the inner build code of the `CustomButton`.
* **Compliant Design (OCP)**:
  Designing the `CustomButton` to accept a generic child `Widget` as its icon and a `ButtonStyle` object for styling. This design allows developers to extend the button's appearance and behavior externally by passing configurations, without modifying the button's source code itself.

---

## 2. Hospital Management System (Billing & Insurance Plans)

* **Non-compliant Design (Bad Design)**:
  A `BillingCalculator` class that computes medical bills based on patient insurance plans. It contains nested conditional statements like:
  `if (insurance == 'AXA') { ... } else if (insurance == 'Allianz') { ... }`
  Every time the hospital signs a contract with a new insurance company, developers must modify the billing calculator class to add the new rules.
* **Compliant Design (OCP)**:
  Define an abstract class named `InsurancePlan` with a `calculateCoverage(double totalBill)` method. Each insurance provider implements this interface in an independent class (e.g., `AxaInsurancePlan`, `AllianzInsurancePlan`). The `BillingCalculator` depends exclusively on the `InsurancePlan` abstraction, allowing new providers to be registered without modifying the calculator class.

---

## 3. Banking System (Payment Gateways)

* **Non-compliant Design (Bad Design)**:
  An e-commerce payment coordinator class containing hardcoded conditionals to check selected checkout methods. If the user chooses a credit card, it connects to a specific payment provider; if they choose cash on delivery, it calls another API. Adding a new gateway requires editing the core payment coordinator.
* **Compliant Design (OCP)**:
  Provide a unified abstract interface named `PaymentGateway` containing a `processPayment(double amount)` method. Each gateway creates its own class implementing this interface (e.g., `StripeGateway`, `PayPalGateway`, `FawryGateway`). The system handles payment operations uniformly via the `PaymentGateway` abstraction, enabling new gateways to be added without modifying the core checkout class.

---

## 4. Delivery Application (Shipping Options & Distance Fees)

* **Non-compliant Design (Bad Design)**:
  A shipping cost calculator that computes shipping prices and estimated delivery times based on the vehicle used (e.g., bike, car, drone). The class contains a `switch (deliveryMethod)` statement. Adding a new delivery method (like drone shipping) requires modifying the switch logic in the calculator.
* **Compliant Design (OCP)**:
  Define an abstract class named `DeliveryVehicle` with abstract methods like `getCost(double distance)` and `getEstimatedTime(double distance)`. Each vehicle type (e.g., `BikeVehicle`, `CarVehicle`, `DroneVehicle`) overrides these methods. The calculator processes shipping costs uniformly through the `DeliveryVehicle` interface, making vehicle additions seamless.

---

## 5. Restaurant System (Multi-channel Notifications)

* **Non-compliant Design (Bad Design)**:
  A notification dispatcher class that sends alerts when a customer order is placed. The class contains hardcoded methods for SMS text messaging, SMTP email alerts, and local kitchen monitors. Adding a new notification channel (like WhatsApp or Telegram) requires modifying the core dispatcher class to add new configurations and logic.
* **Compliant Design (OCP)**:
  Design a unified abstract interface named `NotificationChannel` with a `send(String message)` method. Create independent classes for each channel (e.g., `SmsChannel`, `EmailChannel`, `WhatsAppChannel`). The order manager receives a list of `NotificationChannel` instances and loops through them to send notifications, allowing channels to be added or removed dynamically without touching order logic.