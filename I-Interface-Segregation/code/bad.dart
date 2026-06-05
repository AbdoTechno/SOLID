// كود عك بيخالف مبدأ الـ ISP
// واجهة واحدة ضخمة بتجبر الطالب والمدرس يكتبوا ميثودس ملهمش علاقة بيها!

abstract class UniversityMember {
  void attendClass();
  void submitAssignment();
  void teachCourse();
  void gradeExams();
  void calculateSalary();
}

// كلاس الطالب مضطر يطبق كل ميثودس المدرس والموظف غصب عنه!
class Student implements UniversityMember {
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

  // عك كسر الـ ISP! الطالب مش بيدرس كورسات
  @override
  void teachCourse() {
    throw UnimplementedError('الطالب لا يمكنه تدريس الكورسات!');
  }

  // عك كسر الـ ISP! الطالب مش بيصحح امتحانات
  @override
  void gradeExams() {
    throw UnimplementedError('الطالب لا يمكنه تصحيح الامتحانات!');
  }

  // عك كسر الـ ISP! الطالب مش بياخد مرتب، هو بيدفع مصاريف
  @override
  void calculateSalary() {
    throw UnimplementedError('الطالب لا يتقاضى راتباً!');
  }
}

// كلاس المدرس مضطر يطبق ميثود تسليم الواجب بتاعة الطلاب!
class Teacher implements UniversityMember {
  final String name;
  Teacher(this.name);

  @override
  void attendClass() {
    print('الدكتور $name دخل المدرج عشان يشرح.');
  }

  // عك كسر الـ ISP! الدكتور مش بيسلم واجبات
  @override
  void submitAssignment() {
    throw UnimplementedError('الدكتور لا يسلم تكليفات، هو من يطلبها!');
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
  print('--- تشغيل كود الجامعة العك (Bad ISP Example) ---');
  
  final student = Student('كريم يوسف');
  student.attendClass();
  student.submitAssignment();

  try {
    student.teachCourse(); // هيعمل Crash!
  } catch (e) {
    print('خطأ في السيستم: $e');
  }

  final teacher = Teacher('د. أحمد جمال');
  teacher.teachCourse();
  
  try {
    teacher.submitAssignment(); // هيعمل Crash!
  } catch (e) {
    print('خطأ في السيستم: $e');
  }
}
