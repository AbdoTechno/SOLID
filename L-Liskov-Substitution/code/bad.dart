// Non-compliant code violating the Liskov Substitution Principle (LSP)
// The subclass (AuditorStudent) cannot fulfill the parent's contract and throws an Exception, breaking the system behavior.

class Student {
  final String name;
  Student(this.name);

  void study() {
    print('$name is studying the lectures.');
  }

  void applyForScholarship() {
    print('$name successfully applied for the scholarship.');
  }
}

// Regular Student - A subtype that adheres to the parent's behaviors
class RegularStudent extends Student {
  RegularStudent(String name) : super(name);
}

// Auditor Student - A student attending lectures without grades/scholarship privileges
class AuditorStudent extends Student {
  AuditorStudent(String name) : super(name);

  @override
  void applyForScholarship() {
    // Violates LSP! An auditor student should not have the ability to apply for scholarships.
    // We are forced to throw an exception to override/disable the inherited behavior!
    throw Exception('Error: Auditor student $name cannot apply for scholarships!');
  }
}

void processScholarshipApplications(List<Student> students) {
  for (var student in students) {
    try {
      student.applyForScholarship();
    } catch (e) {
      print('An error occurred in the system: $e');
    }
  }
}

void main() {
  print('--- Running Non-compliant Code (Bad LSP Example) ---');
  
  final List<Student> universityStudents = [
    RegularStudent('Ali Hassan'),
    RegularStudent('Mona Ahmed'),
    AuditorStudent('Omar Makram'), // This breaks the application processing loop!
  ];

  processScholarshipApplications(universityStudents);
}
