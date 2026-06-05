// Compliant code adhering to the Interface Segregation Principle (ISP)
// Split the single bloated interface into 4 specialized interfaces. Each class implements only what it needs.

// 1. Small, Specialized Interfaces
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

// 2. Student class: Only implements attending classes and submitting assignments
class Student implements ClassAttendee, AssignmentSubmitter {
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
}

// 3. Teacher class: Implements attending classes, teaching, and receiving a salary
class Teacher implements ClassAttendee, CourseInstructor, SalariedEmployee {
  final String name;
  Teacher(this.name);

  @override
  void attendClass() {
    print('Dr. $name entered the lecture hall to teach.');
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
  print('--- Running Compliant Code (Good ISP Example) ---');

  // Student does their job without dead methods
  final student = Student('Karim Youssef');
  student.attendClass();
  student.submitAssignment();

  print('-----------------------------------------');

  // Teacher does their job without being forced to implement student assignments
  final teacher = Teacher('Dr. Ahmed Gamal');
  teacher.attendClass();
  teacher.teachCourse();
  teacher.gradeExams();
  teacher.calculateSalary();
}
