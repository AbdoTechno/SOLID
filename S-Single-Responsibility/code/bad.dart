// كود عك بيخالف مبدأ الـ SRP
// الكلاس ده بيعمل كل حاجة: بيانات الطالب، التسجيل في المواد، الحفظ في الداتا بيز، وبعت الإيميلات!

import 'dart:io';

class Student {
  final String id;
  final String name;
  final String email;
  final List<String> enrolledCourses = [];

  Student({required this.id, required this.name, required this.email});

  // 1. مسؤولية إدارة الكورسات
  void enrollInCourse(String courseName) {
    enrolledCourses.add(courseName);
    print('تم تسجيل الطالب $name في كورس: $courseName');
  }

  // 2. مسؤولية الحفظ في قاعدة البيانات (Persistence)
  void saveToDatabase() {
    print('جاري الاتصال بقاعدة البيانات...');
    // محاكاة حفظ في الداتا بيز
    sleep(Duration(milliseconds: 500));
    print('تم حفظ الطالب $name بنجاح في جدول Students.');
  }

  // 3. مسؤولية الإشعارات والاتصال (Notification)
  void sendWelcomeEmail() {
    print('جاري إرسال إيميل ترحيبي إلى $email ...');
    // محاكاة إرسال إيميل
    sleep(Duration(milliseconds: 500));
    print('تم إرسال الإيميل بنجاح: "أهلاً بك يا $name في كليتنا!"');
  }
}

void main() {
  print('--- تشغيل الكود العك (Bad SRP Example) ---');
  final student = Student(id: '101', name: 'أحمد محروس', email: 'ahmed@example.com');
  
  student.enrollInCourse('علم الحاسوب 101');
  student.saveToDatabase();
  student.sendWelcomeEmail();
}
