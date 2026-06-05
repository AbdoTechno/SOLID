<div dir="rtl">

# مشروع نظام إدارة الجامعة المتكامل المبسط: SOLID-Complete-Project 🏫

بص يا صديقي، الفولدر ده بيحتوي على تطبيق عملي **مبسط جداً وبأقل كود ممكن** لنظام **شؤون طلاب الجامعة**. 
الهدف منه مش بناء أبلكيشن معقد، بل تقديم كود سهل القراءة والتدقيق بيوضح إزاي الـ 5 مبادئ بتوع **SOLID** بيتعاونوا مع بعض في تناسق تام ومن غير أي تشتيت أو إشعارات زيادة.

---

## 🚀 الميزات الأساسية للنظام (Core Features)

1. **تسجيل الطلاب (Student Registration)**: تسجيل الطالب الجديد في قاعدة البيانات (المستودع).
2. **تسجيل المواد (Course Enrollment)**: تمكين الطلاب من تسجيل المواد الدراسية الخاصة بهم.
3. **رصد الدرجات (Grade Management)**: رصد درجات الطلاب في المواد المسجلين فيها مع حماية أمان تمنع رصد درجات للطلاب المستمعين (Audit) بشكل يحترم الـ LSP.

---

## 📂 محتويات الفولدر

* 📝 **[explanation.md](explanation.md)**: شرح تفصيلي وعميق لأماكن استخدام كل مبدأ من مبادئ SOLID الخمسة في الكود المبسط.
* 🖍️ **[architecture.md](architecture.md)**: مخططات الـ ASCII المبسطة للعلاقات والاعتماديات بين الكلاسات.
* 📂 **[project-structure.md](project-structure.md)**: خريطة وتفصيل ملفات السورس كود.
* 💻 **`source-code/`**: الكود المصدري الفعلي المكتوب بلغة Dart وجاهز للتشغيل.
  - [interfaces.dart](source-code/interfaces.dart): العقود والتجريدات (`StudentRepository`).
  - [models.dart](source-code/models.dart): كلاسات الدومين والطلاب (`CreditStudent` و `AuditStudent`).
  - [repositories.dart](source-code/repositories.dart): البنية التحتية لحفظ البيانات في الذاكرة.
  - [services.dart](source-code/services.dart): منطق العمل والـ business logic للخدمات.
  - [main.dart](source-code/main.dart): ربط كل المكونات وتشغيل السيناريو بالـ Dependency Injection.

---

## ⚙️ إزاي تشغل المشروع وتجربه بنفسك؟

عشان ترن الكود وتتفرج على النتيجة بنفسك، افتح الـ Terminal في مسار المشروع وجري الأمر ده:

```bash
dart run SOLID-Complete-Project/source-code/main.dart
```

هتلاقي السيناريوهات بتطبع مخرجات واضحة وبسيطة جداً في الكونسول!


</div>