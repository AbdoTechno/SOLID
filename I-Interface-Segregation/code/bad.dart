// Non-compliant code violating the Interface Segregation Principle (ISP)
// A single bloated interface forces both Student and Teacher to implement methods irrelevant to them.

abstract class UniversityMember {
  void attendClass();
  void submitAssignment();
  void teachCourse();
  void gradeExams();
  void calculateSalary();
}

// Student is forced to implement Teacher and Employee methods!
class Student implements UniversityMember {
  final String name;
  Student(this.name);

  @override
  void attendClass() {
    print('$name attended the lecture in the hall.');
  }

  @override
  void submitAssignment() {
    print('$name submitted the practical assignment.');
  }

  // Violates ISP! A student does not teach courses.
  @override
  void teachCourse() {
    throw UnimplementedError('Students cannot teach courses!');
  }

  // Violates ISP! A student does not grade exams.
  @override
  void gradeExams() {
    throw UnimplementedError('Students cannot grade exams!');
  }

  // Violates ISP! A student does not receive a salary; they pay tuition.
  @override
  void calculateSalary() {
    throw UnimplementedError('Students do not receive a salary!');
  }
}

// Teacher is forced to implement the Student method of submitting assignments!
class Teacher implements UniversityMember {
  final String name;
  Teacher(this.name);

  @override
  void attendClass() {
    print('Dr. $name entered the lecture hall to teach.');
  }

  // Violates ISP! A teacher does not submit assignments.
  @override
  void submitAssignment() {
    throw UnimplementedError('Teachers do not submit assignments; they assign them!');
  }

  @override
  void teachCourse() {
    print('Dr. $name is teaching the programming course.');
  }

  @override
  void gradeExams() {
    print('Dr. $name is grading the exam papers.');
  }

  @override
  void calculateSalary() {
    print('Salary for Dr. $name successfully calculated.');
  }
}

void main() {
  print('--- Running Non-compliant Code (Bad ISP Example) ---');
  
  final student = Student('Karim Youssef');
  student.attendClass();
  student.submitAssignment();

  try {
    student.teachCourse(); // Will crash!
  } catch (e) {
    print('System Error: $e');
  }

  final teacher = Teacher('Dr. Ahmed Gamal');
  teacher.teachCourse();
  
  try {
    teacher.submitAssignment(); // Will crash!
  } catch (e) {
    print('System Error: $e');
  }
}
