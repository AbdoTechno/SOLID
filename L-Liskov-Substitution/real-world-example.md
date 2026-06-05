<div dir="rtl">

# أمثلة من الواقع لمبدأ إحلال ليسكوف: real-world-example.md 🌍

مبدأ الـ LSP بيحمينا من تصميم علاقات توريث مشوهة. دي 5 أمثلة عملية توضح المبدأ ده في كذا مجال:

---

## 1. 📱 مثال في Flutter (Custom Scroll Controller / Controller Hierarchy)

* **الكود العك**:
  تعمل Custom Scroll Controller بيورث من الـ `ScrollController` الأساسي بتاع فلاتر. بس عشان تغير سلوك معين، خليت ميثود `jumpTo(double value)` ترمي Exception أو متعملش حاجة لو المستخدم حاول يعمل Scroll في اتجاه معين. لو استعملت الكنترولر ده مع `ListView` عادية، فلاتر هيحصل فيه Crash داخلي لأن الـ Framework بيتوقع إن أي `ScrollController` بيقبل الـ `jumpTo` بدون مشاكل.
* **تطبيق الـ LSP**:
  لو الكنترولر بتاعك مش بيدعم الـ Jump العادي، ما تورثش من `ScrollController` مباشرة، أو افصل السلوك واعمل Custom Controller بيتعامل مع الأحداث بشكل منفصل بدون كسر وعود الأب.

---

## 🏥 2. مثال في نظام المستشفيات (Patients & Ward Assignments)

* **الكود العك**:
  كلاس أب اسمه `Patient` فيه ميثود `assignToRoom(Room room)`. 
  كلاس ابن اسمه `Outpatient` (المريض الخارجي اللي بييجي يكشف ويمشي) بيورث من `Patient`. بس المريض الخارجي ملوش أوضة محجوزة في المستشفى! فتقوم ميثود `assignToRoom` في كلاس `Outpatient` ترمي Exception: `CannotAssignOutpatientToRoom`.
* **تطبيق الـ LSP**:
  - كلاس الأب `Patient`: فيه البيانات الأساسية للمريض زي الاسم والرقم الطبي.
  - كلاس وسيط `Inpatient` (المريض المقيم) بيورث من `Patient` وفيه ميثود `assignToRoom()`.
  - كلاس `Outpatient` بيورث من `Patient` مباشرة ومفيهوش ميثود الغرفة من الأساس.

---

## 🏦 3. مثال في نظام البنوك (Credit Cards vs. Prepaid Cards)

* **الكود العك**:
  كلاس أب اسمه `BankCard` فيه ميثود `withdraw(double amount)` وميثود `chargeOverdraft(double amount)` (السحب على المكشوف أو الاستدانة).
  كلاس ابن اسمه `PrepaidCard` (كارت مسبق الدفع) بيورث من `BankCard`. الكارت مسبق الدفع مستحيل يسحب على المكشوف، فتقوم ميثود `chargeOverdraft` ترمي Exception أو ترجع Null بشكل يبوظ لوجيك الحسابات.
* **تطبيق الـ LSP**:
  - كلاس الأب `BankCard` فيه فقط السحب العادي `withdraw`.
  - كلاس ابن `CreditCard` بيورث من `BankCard` وبيضيف ميثود `chargeOverdraft`.
  - كلاس `PrepaidCard` بيورث من `BankCard` ويوفر السحب العادي بس في حدود الرصيد المتوفر.

---

## 🛵 4. مثال في تطبيق توصيل طلبات (Vehicles & Delivery Operations)

* **الكود العك**:
  كلاس أب اسمه `DeliveryVehicle` وفيه ميثود `refuelGasoline()` (تعبئة بنزين).
  كلاس ابن اسمه `ElectricBike` (عجلة كهربائية) بيورث منه. العجلة الكهربائية بتتشحن بالكهرباء ومش بتاخد بنزين! فتقوم ميثود `refuelGasoline` ترمي Exception.
* **تطبيق الـ LSP**:
  - كلاس الأب `DeliveryVehicle` فيه ميثودس عامة زي `startEngine()` أو `move()`.
  - كلاس ابن `GasolineVehicle` فيه ميثود `refuelGasoline()`.
  - كلاس ابن `ElectricVehicle` فيه ميثود `chargeBattery()`.
  بكدة مفيش كلاس بيضطر ينفذ وظيفة ملهاش علاقة بطبيعته الفيزيائية.

---

## 🍔 5. مثال في نظام المطاعم (Menu Items & Preparation)

* **الكود العك**:
  كلاس أب اسمه `MenuItem` وفيه ميثود `cook()` (طهي الوجبة).
  كلاس ابن اسمه `SoftDrink` (مياه غازية) بيورث من `MenuItem`. المياه الغازية مش بتتطبخ! فالمطور يخلي ميثود `cook()` فاضية أو ترمي Exception.
* **تطبيق الـ LSP**:
  - كلاس الأب `MenuItem` بيشيل الاسم والسعر.
  - كلاس ابن `CookedItem` (وجبات مطبوخة) بيورث منه وبيضيف ميثود `cook()`.
  - كلاس ابن `Beverage` (مشروبات) بيورث منه وبيضيف ميثود `chill()` (تبريد).


</div>