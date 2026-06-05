<div dir="rtl">

# هيكل ملفات المشروع المبسط: project-structure.md 📂

بص يا صديقي، دي الخريطة الكاملة والمبسطة لملفات المشروع بعد ما شيلنا نظام الإشعارات وملفاته.

---

## 🌳 شجرة المجلدات المبسطة (Simplified Directory Tree)

```text
SOLID-Complete-Project/
├── README.md                 # دليل تشغيل وفهم المشروع بشكل مبسط.
├── explanation.md            # شرح تطبيق المبادئ الخمسة (S, O, L, I, D) في الكود الجديد.
├── architecture.md           # المخططات المعمارية وعلاقات الكلاسات بالـ ASCII.
├── project-structure.md      # الملف ده (خريطة الملفات).
└── source-code/              # الكود المصدري الفعلي المكتوب بلغة Dart.
    ├── interfaces.dart       # عقد التخزين (DIP).
    ├── models.dart           # كلاسات الطلاب والكورسات (LSP & ISP).
    ├── repositories.dart     # البنية التحتية لحفظ البيانات في الذاكرة (DIP).
    ├── services.dart         # خدمات التسجيل والمواد ورصد الدرجات (SRP).
    └── main.dart             # نقطة الانطلاق وتجميع السيستم بالـ Dependency Injection.
```

---

## 📝 تفصيل مسؤولية كل ملف (File Responsibilities)

1. **`interfaces.dart`**:
   - بيعرف واجهة `StudentRepository` للتخزين.
   - **الهدف**: توفير واجهة تجريدية لفك التعشيق مع قواعد البيانات.

2. **`models.dart`**:
   - بيشمل كلاس `Course`.
   - بيعرف واجهة `Gradable` لدرجات الطلاب.
   - بيشمل كلاس الأب `BaseStudent`.
   - بيشمل كلاسات الأبناء `CreditStudent` و `AuditStudent`.
   - **الهدف**: تمثيل الداتا وحماية شروط التوريث والدرجات بدون كراش.

3. **`repositories.dart`**:
   - بيشمل كلاس `InMemoryStudentRepository` لحفظ بيانات الطلاب في الذاكرة المؤقتة.
   - **الهدف**: محاكاة قاعدة البيانات الحقيقية بأقل كود ممكن لخدمة الـ DIP.

4. **`services.dart`**:
   - بيشمل كلاس `StudentRegistry` لتسجيل الطلاب الجدد.
   - بيشمل كلاس `EnrollmentManager` لتسجيل المواد.
   - بيشمل كلاس `GradeBook` لرصد الدرجات.
   - **الهدف**: كتابة الـ Business Logic الحقيقي متقسم لخدمات مستقلة (SRP).

5. **`main.dart`**:
   - بينشئ كائنات الخدمات والـ Repositories.
   - بيركب الأجزاء مع بعضها (Dependency Injection).
   - بيعمل محاكاة كاملة لتسجيل طالبين (عادي ومستمع)، وتسجيل موادهم، ورصد درجاتهم.
   - **الهدف**: نقطة التشغيل وتجميع سيمفونية الـ SOLID في أبسط شكل.


</div>