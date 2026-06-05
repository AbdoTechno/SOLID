// نماذج البيانات وكيانات الدومين (Models & Domain Entities)
// بتعبر عن الـ LSP والـ ISP في تنظيم خصائص الطلاب والكورسات

// 1. كلاس الكورس
class Course {
  final String code;
  final String name;

  Course({required this.code, required this.name});
}

// 2. واجهة التقييم والدرجات (ISP): للطلاب اللي بيمتحنوا بس
abstract class Gradable {
  void addGrade(Course course, String grade);
  Map<Course, String> getGrades();
}

// 3. كلاس الطالب الأساسي
abstract class BaseStudent {
  final String id;
  final String name;
  final List<Course> enrolledCourses = [];

  BaseStudent({required this.id, required this.name});

  void enroll(Course course) {
    if (enrolledCourses.any((c) => c.code == course.code)) {
      print('تنبيه: الطالب $name مسجل بالفعل في كورس ${course.name}');
      return;
    }
    enrolledCourses.add(course);
    print('تم تسجيل الطالب $name في كورس ${course.name} بنجاح.');
  }
}

// 4. طالب الساعات المعتمدة (Credit Student): طالب عادي بيمتحن وبياخد درجات (LSP & ISP Compliant)
class CreditStudent extends BaseStudent implements Gradable {
  final Map<Course, String> _grades = {};

  CreditStudent({required String id, required String name})
      : super(id: id, name: name);

  @override
  void addGrade(Course course, String grade) {
    if (!enrolledCourses.contains(course)) {
      print('خطأ: لا يمكن رصد درجة لكورس ${course.name} لأن الطالب $name غير مسجل فيه!');
      return;
    }
    _grades[course] = grade;
    print('تم رصد درجة ($grade) للطالب $name في كورس ${course.name}.');
  }

  @override
  Map<Course, String> getGrades() => Map.unmodifiable(_grades);
}

// 5. الطالب المستمع (Audit Student): بيحضر الكورس بس ملوش درجات (LSP Compliant)
class AuditStudent extends BaseStudent {
  AuditStudent({required String id, required String name})
      : super(id: id, name: name);
}
