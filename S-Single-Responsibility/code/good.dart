// كود نظيف ومتصلح بناءً على مبدأ الـ SRP
// كل كلاس هنا ليه وظيفة واحدة وسبب واحد للتغيير.

import 'dart:io';

// 1. كلاس الطالب: مسؤول فقط عن الاحتفاظ ببيانات الطالب والكورسات المسجل فيها
class Student {
  final String id;
  final String name;
  final String email;
  final List<String> enrolledCourses = [];

  Student({required this.id, required this.name, required this.email});

  void enrollInCourse(String courseName) {
    enrolledCourses.add(courseName);
    print('تم تسجيل الطالب $name في كورس: $courseName');
  }
}

// 2. كلاس المخزن: مسؤول فقط عن عمليات الحفظ وجلب البيانات (Database/Persistence operations)
class StudentRepository {
  void saveToDatabase(Student student) {
    print('جاري الاتصال بقاعدة البيانات...');
    // محاكاة حفظ في الداتا بيز
    sleep(Duration(milliseconds: 500));
    print('تم حفظ الطالب ${student.name} بنجاح في جدول Students.');
  }
}

// 3. كلاس خدمة الإيميل: مسؤول فقط عن إرسال الرسائل والإشعارات (Notification operations)
class EmailService {
  void sendWelcomeEmail(Student student) {
    print('جاري إرسال إيميل ترحيبي إلى ${student.email} ...');
    // محاكاة إرسال إيميل
    sleep(Duration(milliseconds: 500));
    print('تم إرسال الإيميل بنجاح: "أهلاً بك يا ${student.name} في كليتنا!"');
  }
}

void main() {
  print('--- تشغيل الكود النظيف (Good SRP Example) ---');
  
  // 1. بننشئ الطالب
  final student = Student(id: '101', name: 'أحمد محروس', email: 'ahmed@example.com');
  student.enrollInCourse('علم الحاسوب 101');
  
  // 2. بنحفظ الطالب عن طريق الريبوزتري المخصص
  final repo = StudentRepository();
  repo.saveToDatabase(student);
  
  // 3. بنبعت الإيميل عن طريق سيرفس الإيميل المخصصة
  final emailService = EmailService();
  emailService.sendWelcomeEmail(student);
}
