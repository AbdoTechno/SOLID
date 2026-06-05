<div dir="rtl">

# مشروع نظام إدارة الجامعة المتكامل المبسط

يحتوي هذا المجلد على تطبيق عملي مبسط لنظام شؤون طلاب الجامعة بأقل قدر ممكن من الكود البرمجي. لا يهدف هذا المشروع إلى بناء تطبيق معقد، بل يهدف لتقديم نموذج سهل القراءة والتحليل يوضح كيفية تكامل مبادئ SOLID الخمسة معاً بشكل متناسق ودون أي تعقيدات غير ضرورية.

---

## الميزات الأساسية للنظام (Core Features)

1. **تسجيل الطلاب (Student Registration)**: حفظ بيانات الطالب الجديد في قاعدة البيانات (أو الـ Repository).
2. **تسجيل المواد (Course Enrollment)**: تمكين الطلاب من تسجيل المواد الدراسية الخاصة بهم.
3. **رصد الدرجات (Grade Management)**: رصد درجات الطلاب في المواد المسجلين فيها، مع تطبيق قيود تمنع رصد درجات للطلاب المستمعين (Audit Students) بما يتوافق مع مبدأ إحلال ليسكوف (LSP).

---

## مكونات المشروع

* 📝 **[explanation.md](explanation.md)**: شرح تفصيلي وعميق لأماكن تطبيق كل مبدأ من مبادئ SOLID الخمسة في الكود.
* 🖍️ **[architecture.md](architecture.md)**: مخططات توضيحية مبسطة للعلاقات والاعتماديات بين الفئات.
* 📂 **[project-structure.md](project-structure.md)**: خريطة وتفصيل ملفات الكود المصدري.
* 💻 **`source-code/`**: الكود المصدري الفعلي المكتوب بلغة Dart:
  - [interfaces.dart](source-code/interfaces.dart): العقود والتجريدات (مثل `StudentRepository`).
  - [models.dart](source-code/models.dart): فئات نطاق العمل للطلاب (مثل `CreditStudent` و`AuditStudent`).
  - [repositories.dart](source-code/repositories.dart): البنية التحتية لحفظ البيانات في الذاكرة.
  - [services.dart](source-code/services.dart): خدمات منطق العمل (Business Logic Services).
  - [main.dart](source-code/main.dart): ربط كل المكونات وتشغيل العمليات باستخدام حقن الاعتمادية.

---

## كيفية تشغيل المشروع وتجربته

لتشغيل الكود ومعاينة المخرجات، افتح واجهة الأوامر (Terminal) في مسار المشروع الرئيسي ونفذ الأمر التالي:

```bash
dart run SOLID-Complete-Project/source-code/main.dart
```

ستظهر مخرجات واضحة وتفصيلية للعمليات المختلفة في موجه الأوامر (Console).

</div>