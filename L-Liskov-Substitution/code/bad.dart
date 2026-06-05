// كود عك بيخالف مبدأ الـ LSP
// كلاس الابن (AuditorStudent) مش بيقدر ينفذ ميثود الأب وبيرمي Exception بيبوظ السيستم!

class Student {
  final String name;
  Student(this.name);

  void study() {
    print('$name بيذاكر المحاضرات.');
  }

  void applyForScholarship() {
    print('$name قدم على المنحة الدراسية بنجاح.');
  }
}

// طالب منتظم (Regular Student) - ابن ملتزم بسلوك الأب
class RegularStudent extends Student {
  RegularStudent(String name) : super(name);
}

// طالب مستمع (Auditor Student) - طالب بيحضر محاضرات بس ملوش شهادات ولا منح
class AuditorStudent extends Student {
  AuditorStudent(String name) : super(name);

  @override
  void applyForScholarship() {
    // كسر مبدأ الـ LSP! الطالب المستمع مش من حقه يقدم على منحة.
    // اضطرينا نرمي Exception عشان نلغي السلوك الموروث!
    throw Exception('خطأ: الطالب المستمع $name لا يمكنه التقديم على المنحة الدراسية!');
  }
}

void processScholarshipApplications(List<Student> students) {
  for (var student in students) {
    try {
      student.applyForScholarship();
    } catch (e) {
      print('كارثة حصلت في السيستم: $e');
    }
  }
}

void main() {
  print('--- تشغيل كود المنح العك (Bad LSP Example) ---');
  
  final List<Student> universityStudents = [
    RegularStudent('علي حسن'),
    RegularStudent('منى أحمد'),
    AuditorStudent('عمر مكرم'), // ده هيبوظ عملية المعالجة!
  ];

  processScholarshipApplications(universityStudents);
}
