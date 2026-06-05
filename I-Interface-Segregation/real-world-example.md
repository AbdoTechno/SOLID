<div dir="rtl">

# أمثلة من الواقع لمبدأ فصل الواجهات: real-world-example.md 🌍

مبدأ الـ ISP بيخلي الواجهات رشيقة وسهلة الاستخدام. دي 5 أمثلة عملية توضح المبدأ ده في مجالات مختلفة:

---

## 1. 📱 مثال في Flutter (TextInputFormatter / FocusNode vs. TextSelectionControls)

* **الكود العك**:
  تخيل لو فلاتر كان عامل واجهة واحدة اسمها `TextFieldHelper` وفيها ميثودس لتغيير الفوكس، وتنسيق النص (formatting)، وعمليات الكوبي والبيست، والتحقق من الإدخال (validation). لو حبيت تعمل فورماتر يمنع كتابة الحروف العربي مثلاً، هتضطر تعمل Implement لكل الميثودس دي وتسيبها فاضية!
* **تطبيق الـ ISP**:
  فلاتر مقسم الدنيا لواجهات صغيرة جداً ورشيقة:
  - `TextInputFormatter`: فيها ميثود واحدة `formatEditUpdate` لتنسيق النص.
  - `FocusNode`: لإدارة الفوكس بس.
  - `FormFieldValidator`: للتحقق من النص بس.
  بكدة لما تعوز تعمل Custom Formatter، بتعمل Implement للـ `TextInputFormatter` بس وأنت رايق.

---

## 🏥 2. مثال في نظام المستشفيات (Medical Staff & Actions)

* **الكود العك**:
  واجهة اسمها `HospitalWorker` فيها ميثودس: `performSurgery()` (عملية جراحية)، `prescribeMedication()` (روشتة دوا)، `administerInjection()` (حقن الإبر)، `cleanRooms()` (تنظيف).
  الممرضة أو عامل النظافة لو طبقوا الواجهة دي، هيضطروا يرموا Exceptions في ميثود العملية الجراحية لأن ده شغل الجراح بس.
* **تطبيق الـ OCP/ISP**:
  تقسيم الواجهة إلى:
  - `Surgeon`: فيها `performSurgery()`.
  - `Prescriber`: فيها `prescribeMedication()`.
  - `CareGiver`: فيها `administerInjection()`.
  - `SanitationWorker`: فيها `cleanRooms()`.

---

## 🏦 3. مثال في نظام البنوك (ATM Operations)

* **الكود العك**:
  واجهة اسمها `AtmService` فيها ميثودس: `withdrawCash()`, `depositCash()`, `transferMoney()`, `applyForLoan()` (تقديم على قرض)، `updatePin()`.
  المستخدم العادي في الـ ATM البسيطة مش بيقدر يقدم على قرض من الشاشة! والماكينة هتضطر ترمي Exception لو حد حاول ينادي الميثود دي.
* **تطبيق الـ ISP**:
  - واجهة `BasicAtm`: فيها السحب والإيداع والاستعلام عن الرصيد.
  - واجهة `AdvancedAtm`: بتورث من الأولى وتضيف التحويل وتحديث الـ PIN.
  - واجهة `BankPortalService`: فيها تقديم القروض والخدمات الاستثمارية المعقدة الخاصة بفرع البنك.

---

## 🛵 4. مثال في تطبيق توصيل طلبات (Driver Actions)

* **الكود العك**:
  واجهة اسمها `Courier` فيها ميثودس: `driveCar()`, `rideBike()`, `flyDrone()`, `collectCash()`, `processCreditCard()`.
  الطيار اللي شغال بـ "عجلة" مش هينفع يسوق عربية، والدرون الذكي مش هيعرف يلم فلوس كاش من الزبون!
* **تطبيق الـ ISP**:
  - واجهة `RoadNavigator`: فيها التوجيه وقيادة المركبات الأرضية.
  - واجهة `CashHandler`: للطيارين اللي بيستلموا كاش (COD).
  - واجهة `DroneNavigator`: للدرونز الطائرة ذاتية القيادة.

---

## 🍔 5. مثال في نظام المطاعم (Restaurant Workers)

* **الكود العك**:
  واجهة اسمها `Staff` فيها: `takeOrder()`, `prepareFood()`, `serveFood()`, `cleanTables()`, `calculateBill()`.
  الجرسون (Waiter) مش بيطبخ الأكل، والطباخ مش بينظف الترابيزات في وجود عمال نظافة مخصصين.
* **تطبيق الـ ISP**:
  - واجهة `OrderTaker`: للتعامل مع طلبات الزباين.
  - واجهة `FoodPreparer`: للطباخين لتحضير الأكل.
  - واجهة `FoodServer`: للجرسونات لتوصيل الأكل للترابيزات.
  - واجهة `Cleaner`: لعمال النظافة.


</div>