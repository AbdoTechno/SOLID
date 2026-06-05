# Real-World Examples of Dependency Inversion Principle (DIP)

The Dependency Inversion Principle (DIP) is a key pillar for designing modular, flexible, and scalable systems. Here are five practical examples showing how this principle applies across different domains:

---

## 1. Flutter Framework: API Clients (Dio vs. Http Client / Clean Architecture Repositories)

* **Bad Design**:
  A Cubit, Bloc, or ViewModel instantiates the networking client directly inside itself, for example: `final dio = Dio();` to execute HTTP calls.
  If you later decide to replace the `Dio` library with Dart's native `Http` package, or if you need to fetch data from a local cache instead, you will have to open and modify all Cubits and change their network call code.
* **Good Design**:
  - Define an abstract interface named `ApiClient` containing common methods like `get(String url)`.
  - Create a concrete class `DioApiClient` that implements `ApiClient` using the Dio package.
  - Create another concrete class `HttpApiClient` that implements `ApiClient` using the Http package.
  - Make the Cubits depend exclusively on the abstract `ApiClient` interface and receive it via the constructor. This allows swapping the network library globally with a single line of code in the dependency injection configuration.

---

## 2. Hospital Management System: SMS Notification Services

* **Bad Design**:
  When a patient books an appointment, the system sends an SMS confirmation. The `AppointmentManager` class directly instantiates and connects to Twilio: `final twilio = TwilioClient(apiKey);` to send the message.
  If the hospital administration decides to switch to Vodafone SMS to reduce operational costs, the developer must modify the `AppointmentManager` class to update the API calls.
* **Good Design**:
  - Create an abstract interface `SmsSender` with the method `sendSms(String phone, String message)`.
  - Implement concrete classes `TwilioSender` and `VodafoneSender` implementing the `SmsSender` interface.
  - Make `AppointmentManager` depend on the abstract `SmsSender` interface and inject the active sender dynamically.

---

## 3. Banking Systems: Customer Credit Scoring

* **Bad Design**:
  To verify a customer's loan eligibility, the bank queries their credit score from a credit bureau (e.g., i-Score or Experian).
  The `LoanApprovalService` class directly instantiates and calls i-Score's API. If the bank decides to query a different bureau later, it must modify the sensitive `LoanApprovalService` class, exposing the core loan processing logic to potential bugs.
* **Good Design**:
  - Define an abstract interface `CreditBureauService` with the method `getCreditScore(String nationalId)`.
  - Implement concrete classes `IScoreService` and `ExperianService` implementing `CreditBureauService`.
  - Make `LoanApprovalService` depend only on the abstract `CreditBureauService` interface.

---

## 4. Delivery Applications: Mapping and GPS Services

* **Bad Design**:
  A delivery system needs to calculate route paths and display maps to couriers.
  The `RoutingManager` class instantiates `GoogleMapsClient` directly.
  If the company transitions to OpenStreetMap or Mapbox to decrease API costs, the routing calculation logic must be completely modified inside `RoutingManager`.
* **Good Design**:
  - Create an abstract interface `MapService` with methods like `calculateRoute(Location start, Location end)`.
  - Implement concrete classes `GoogleMapService` and `MapboxService` implementing the `MapService` interface.
  - Make the `RoutingManager` class depend on the abstract `MapService` interface.

---

## 5. Restaurant Management System: Kitchen Printers

* **Bad Design**:
  When a customer places an order, the system prints a receipt in the kitchen.
  The `OrderService` class directly instantiates `EpsonKitchenPrinter` to send print commands.
  If the kitchen replaces a broken printer with an HP printer that uses a different driver, the ordering system will stop working, forcing the developer to edit `OrderService` to support the new hardware.
* **Good Design**:
  - Define an abstract interface `KitchenPrinter` with the method `printReceipt(String content)`.
  - Implement concrete classes `EpsonPrinter` and `HpPrinter` implementing the `KitchenPrinter` interface.
  - Make `OrderService` depend on the abstract `KitchenPrinter` interface and inject the active printer instance.