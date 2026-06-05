// موديولات منطق العمل والخدمات (Services/Business Logic Layer)
// بيعبر عن الـ SRP وتنسيق التعاون بين الكائنات بشكل سليم

import 'interfaces.dart';
import 'models.dart';

// 1. خدمة تسجيل الطلاب (SRP): مسؤولة فقط عن حفظ الطالب في الداتا بيز
class StudentRegistry {
  final StudentRepository _repository;

  StudentRegistry(this._repository);

  void registerStudent(BaseStudent student) {
    print('\n[Registry] جاري تسجيل الطالب الجديد: ${student.name}...');
    _repository.save(student);
    print('[Registry] تم تسجيل الطالب ${student.name} بنجاح.');
  }
}

// 2. خدمة إدارة التسجيل في المواد (SRP): مسؤولة فقط عن إضافة الكورسات للطالب
class EnrollmentManager {
  void enrollStudentInCourse(BaseStudent student, Course course) {
    print('\n[Enrollment] محاولة تسجيل مادة ${course.name} للطالب ${student.name}...');
    student.enroll(course);
  }
}

// 3. خدمة رصد الدرجات (SRP & LSP & ISP): مسؤولة عن رصد الدرجات للطلاب المؤهلين
class GradeBook {
  void assignGrade(BaseStudent student, Course course, String grade) {
    print('\n[GradeBook] محاولة رصد درجة مادة ${course.name} للطالب ${student.name}...');
    
    // تشيك احترام الـ LSP: لو الطالب بيطبق واجهة الـ Gradable نرصد له الدرجة، غير كدة نرفض بأمان
    if (student is Gradable) {
      (student as Gradable).addGrade(course, grade);
    } else {
      print('تنبيه أمان (LSP): الطالب ${student.name} هو طالب مستمع (Audit). لا يمكن رصد درجات له في النظام.');
    }
  }
}
