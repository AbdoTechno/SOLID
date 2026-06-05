// Compliant code adhering to the Liskov Substitution Principle (LSP)
// Removed exceptions and separated responsibilities so the behavior is fully predictable and safe.

// 1. Base Class: Contains only common behaviors shared by all students without exception
abstract class Student {
  final String name;
  Student(this.name);

  void study();
}

// 2. Specialized Abstract Class: For students eligible for scholarships
abstract class ScholarshipCandidate extends Student {
  ScholarshipCandidate(String name) : super(name);

  void applyForScholarship();
}

// 3. Regular Student: Studies and is eligible for scholarships
class RegularStudent extends ScholarshipCandidate {
  RegularStudent(String name) : super(name);

  @override
  void study() {
    print('$name is studying lectures and completing assignments.');
  }

  @override
  void applyForScholarship() {
    print('$name successfully applied for the scholarship.');
  }
}

// 4. Auditor Student: Studies and attends but is not eligible for scholarships
class AuditorStudent extends Student {
  AuditorStudent(String name) : super(name);

  @override
  void study() {
    print('$name is attending lectures as an auditor, without exams.');
  }
}

// This method now only accepts students who are eligible for scholarships (ScholarshipCandidate)
// It is impossible for an auditor student to be passed here and crash the system at runtime!
void processScholarshipApplications(List<ScholarshipCandidate> candidates) {
  for (var candidate in candidates) {
    candidate.applyForScholarship();
  }
}

void main() {
  print('--- Running Compliant Code (Good LSP Example) ---');

  // University students list
  final List<Student> allStudents = [
    RegularStudent('Ali Hassan'),
    RegularStudent('Mona Ahmed'),
    AuditorStudent('Omar Makram'), // Auditor student
  ];

  print('=== 1. All Students Study ===');
  for (var student in allStudents) {
    student.study();
  }

  print('\n=== 2. Apply for Scholarships (Eligible Students Only) ===');
  // Filter only the students eligible for scholarships to process them safely
  final List<ScholarshipCandidate> scholarshipCandidates = allStudents
      .whereType<ScholarshipCandidate>()
      .toList();

  processScholarshipApplications(scholarshipCandidates);
}
