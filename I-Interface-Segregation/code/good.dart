// كود نظيف ومتصلح بناءً على مبدأ الـ ISP
// قسمنا الواجهة الضخمة لـ 4 واجهات رشيقة وكل كلاس بيختار اللي محتاجه بس.

// 1. الواجهات الصغيرة المتخصصة
abstract class ClassAttendee {
  void attendClass();
}

abstract class AssignmentSubmitter {
  void submitAssignment();
}

abstract class CourseInstructor {
  void teachCourse();
  void gradeExams();
}

abstract class SalariedEmployee {
  void calculateSalary();
}

// 2. كلاس الطالب: بياخد بس دور حضور المحاضرات وتسليم الواجبات
class Student implements ClassAttendee, AssignmentSubmitter {
  final String name;
  Student(this.name);

  @override
  void attendClass() {
    print('$name حضر المحاضرة في المدرج.');
  }

  @override
  void submitAssignment() {
    print('$name سلم التكليف العملي.');
  }
}

// 3. كلاس المدرس: بياخد دور الحضور (للشرح)، والتدريس، وحساب المرتب
class Teacher implements ClassAttendee, CourseInstructor, SalariedEmployee {
  final String name;
  Teacher(this.name);

  @override
  void attendClass() {
    print('الدكتور $name دخل المدرج عشان يشرح.');
  }

  @override
  void teachCourse() {
    print('الدكتور $name بيشرح كورس البرمجة.');
  }

  @override
  void gradeExams() {
    print('الدكتور $name بيصحح أوراق الامتحانات.');
  }

  @override
  void calculateSalary() {
    print('تم حساب مرتب الدكتور $name بنجاح.');
  }
}

void main() {
  print('--- تشغيل كود الجامعة النظيف (Good ISP Example) ---');

  // الطالب بيعمل شغله بس ومن غير ميثودس ميتة
  final student = Student('كريم يوسف');
  student.attendClass();
  student.submitAssignment();

  print('-----------------------------------------');

  // المدرس بيعمل شغله بس ومن غير ما يجبر على تسليم واجابات الطلاب
  final teacher = Teacher('د. أحمد جمال');
  teacher.attendClass();
  teacher.teachCourse();
  teacher.gradeExams();
  teacher.calculateSalary();
}
