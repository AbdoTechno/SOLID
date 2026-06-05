// كود نظيف ومتصلح بناءً على مبدأ الـ LSP
// شيلنا الـ Exception وفصلنا العلاقات صح بحيث الكود يكون متوقع وسليم 100%

// 1. كلاس الأب الرئيسي: بيضم فقط السلوك المشترك بين كل الطلاب بلا استثناء
abstract class Student {
  final String name;
  Student(this.name);

  void study();
}

// 2. كلاس وسيط أو واجهة للطلاب المؤهلين للتقديم على المنح
abstract class ScholarshipCandidate extends Student {
  ScholarshipCandidate(String name) : super(name);

  void applyForScholarship();
}

// 3. الطالب المنتظم: بيذاكر ومؤهل للمنح
class RegularStudent extends ScholarshipCandidate {
  RegularStudent(String name) : super(name);

  @override
  void study() {
    print('$name بيذاكر المحاضرات ويحل التكليفات.');
  }

  @override
  void applyForScholarship() {
    print('$name قدم على المنحة الدراسية بنجاح.');
  }
}

// 4. الطالب المستمع: بيذاكر ويحضر بس مش مؤهل للمنح ومجبرش يكتب كود مش بتاعه
class AuditorStudent extends Student {
  AuditorStudent(String name) : super(name);

  @override
  void study() {
    print('$name بيحضر المحاضرات للاستماع فقط بدون امتحانات.');
  }
}

// الميثود دي دلوقتي بتاخد فقط الطلاب المؤهلين للمنح (ScholarshipCandidate)
// مستحيل طالب مستمع يدخل هنا بالغلط ويبوظ الدنيا في الـ Runtime!
void processScholarshipApplications(List<ScholarshipCandidate> candidates) {
  for (var candidate in candidates) {
    candidate.applyForScholarship();
  }
}

void main() {
  print('--- تشغيل كود المنح النظيف (Good LSP Example) ---');

  // طلاب الجامعة العاديين
  final List<Student> allStudents = [
    RegularStudent('علي حسن'),
    RegularStudent('منى أحمد'),
    AuditorStudent('عمر مكرم'), // طالب مستمع
  ];

  print('=== 1. كل الطلاب بيذاكروا ===');
  for (var student in allStudents) {
    student.study();
  }

  print('\n=== 2. تقديم المنح للطلاب المؤهلين فقط ===');
  // بنعمل فلترة للطلاب المؤهلين للمنح فقط عشان نبعتهم للميثود المخصصة
  final List<ScholarshipCandidate> scholarshipCandidates = allStudents
      .whereType<ScholarshipCandidate>()
      .toList();

  processScholarshipApplications(scholarshipCandidates);
}
