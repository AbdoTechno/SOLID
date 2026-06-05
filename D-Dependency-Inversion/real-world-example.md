<div dir="rtl">

# أمثلة من الواقع لمبدأ عكس الاعتمادية: real-world-example.md 🌍

مبدأ الـ DIP هو العمود الفقري للهندسة المعمارية المرنة. دي 5 أمثلة عملية توضح المبدأ ده في مجالات مختلفة:

---

## 1. 📱 مثال في Flutter (Dio vs. Http / Clean Architecture Repositories)

* **الكود العك**:
  كلاس الـ Cubit أو الـ ViewModel بيكتب جواه مباشرة: `final dio = Dio();` وبيعمل HTTP request. 
  لو بكرة الصبح الـ Dio بقى فيه مشاكل وقررت تستخدم مكتبة `Http` بتاعة Dart، أو حابب تقرأ البيانات من ملف Cache محلي، هتضطر تفتح كل الـ Cubits وتغير الكود المكتوب جوة الميثودس!
* **تطبيق الـ DIP**:
  - بنعمل واجهة اسمها `ApiClient` فيها ميثودس عامة زي `get(String url)`.
  - بنعمل كلاس `DioApiClient` بيطبق الواجهة دي باستخدام Dio.
  - بنعمل كلاس `HttpApiClient` بيطبقها باستخدام Http.
  - الـ Cubit بيعتمد على `ApiClient` ويستقبله في الكونسركتور. كدة تقدر تغير مكتبة الشبكة بالكامل في سطر واحد بالـ Service Locator.

---

## 🏥 2. مثال في نظام المستشفيات (SMS Notification Services)

* **الكود العك**:
  لما المريض يحجز كشف، عايزين نبعتله رسالة تأكيد. كلاس الحجز `AppointmentManager` جواه كود بينشئ اتصال مباشر بـ بوابة رسائل Twilio: `final twilio = TwilioClient(apiKey);` ويبعت الرسالة.
  لو البنك أو المستشفى قرر يغير لـ بوابة رسائل Vodafone لأنها أرخص، هنفتح كلاس الحجز ونعدل كود الاتصال بالشبكة!
* **تطبيق الـ DIP**:
  - واجهة `SmsSender` فيها ميثود `sendSms(String phone, String message)`.
  - كلاس `TwilioSender` وكلاس `VodafoneSender` بيعملوا implement للـ `SmsSender`.
  - كلاس الحجز يعتمد على الـ `SmsSender` ويستقبله بالـ Dependency Injection.

---

## 🏦 3. مثال في نظام البنوك (Credit Bureau Verification)

* **الكود العك**:
  البنك لما ييجي يوافق على قرض، لازم يعمل تشيك على التاريخ الائتماني للعميل (Credit Score) من شركة استعلام معينة (زي i-Score في مصر).
  كلاس الموافقة على القروض `LoanApprovalService` بيكتب كود بيكلم مباشرة سيرفرات i-Score. لو البنك قرر يتعاقد مع شركة استعلام تانية دولية، هنضطر نعدل كود الموافقة على القروض الحساس!
* **تطبيق الـ DIP**:
  - واجهة `CreditBureauService` فيها ميثود `getCreditScore(String nationalId)`.
  - كلاس `IScoreService` وكلاس `ExperianService` بيطبقوا الواجهة دي.
  - كلاس القروض بيكلم الـ `CreditBureauService` التجريدية بس.

---

## 🛵 4. مثال في تطبيق توصيل طلبات (Map & GPS Services)

* **الكود العك**:
  تطبيق التوصيل محتاج يحسب المسافات ويعرض الخريطة للطيار.
  كلاس التوجيه `RoutingManager` بينشئ جواه مباشرة كائن `GoogleMapsClient`.
  شركة جوجل رفعت أسعار الـ API فجأة، فقررنا ننقل لـ OpenStreetMap أو Mapbox. هنفتح كود التوجيه ونعدل لوجيك الحساب والـ GPS بالكامل!
* **تطبيق الـ DIP**:
  - واجهة `MapService` فيها ميثودس زي `calculateRoute(Location start, Location end)`.
  - كلاسات `GoogleMapService` و `MapboxService` بتنفذ الواجهة دي.
  - كلاس التوجيه بيكلم الـ `MapService` التجريدية.

---

## 🍔 5. مثال في نظام المطاعم (Printer Services for Kitchen Orders)

* **الكود العك**:
  لما العميل يطلب أوردر، الكود بيبعت الأوردر للطابعة اللي في المطبخ عشان الشيف يجهزه.
  كلاس الطلبات `OrderService` بينشئ جواه كائن `EpsonKitchenPrinter` ويبعتله كود الطباعة.
  طابعة المطبخ اتحرقت واشترينا طابعة جديدة من ماركة `HP` ليها درايفر مختلف. كود الأوردرات هيضرب وهنضطر نفتحه ونعدله!
* **تطبيق الـ DIP**:
  - واجهة `KitchenPrinter` فيها ميثود `printReceipt(String content)`.
  - كلاسات `EpsonPrinter` و `HpPrinter` بتعمل implement للواجهة.
  - كلاس الطلبات يعتمد على `KitchenPrinter` التجريدية.


</div>