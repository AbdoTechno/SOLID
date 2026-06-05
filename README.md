# SOLID Principles Educational Reference

This project is a comprehensive technical reference and educational guide for the five SOLID principles, developed based on the educational content of Engineer Omar Ahmed. It is designed to simplify revision before technical interviews, deepen your understanding of software design principles, and serve as a long-term reference for writing clean code in real-world projects.

The reference is written in a structured, professional tone that combines technical concepts with practical examples. It uses clear real-world analogies (such as student affairs, wall outlets, or printing systems) and provides fully functional code examples in **Dart**.

---

## Repository Structure

The repository is organized into distinct directories for easy access to specific information:

* `S-Single-Responsibility/`: Single Responsibility Principle (SRP) resources.
* `O-Open-Closed/`: Open-Closed Principle (OCP) resources.
* `L-Liskov-Substitution/`: Liskov Substitution Principle (LSP) resources.
* `I-Interface-Segregation/`: Interface Segregation Principle (ISP) resources.
* `D-Dependency-Inversion/`: Dependency Inversion Principle (DIP) resources.
* `SOLID-Complete-Project/`: A simplified, fully integrated project (university student affairs system) demonstrating how all five principles work together cohesively.
* `INTERVIEW-NOTES/`: Interview questions and guidelines categorized by professional level (Junior, Mid-Level, Advanced).
* `MASTER-SUMMARY.md`: A high-level summary table and cheat sheet for quick review.

---

## Directory Contents (For Each Principle)

Each principle's directory contains the following files:

1. **`README.md`**: Introduction to the principle, its purpose, and the drawbacks of ignoring it.
2. **`theory.md`**: Theoretical explanation and the design philosophy behind the principle.
3. **`bad-example.md`**: Breakdown of a design that violates the principle and the problems it causes.
4. **`good-example.md`**: Breakdown of the compliant design and its architectural benefits.
5. **`real-world-example.md`**: Real-world application scenarios across different domains (e.g., API clients, payment gateways).
6. **`code-explanation.md`**: Line-by-line explanation of the Dart source code.
7. **`interview-questions.md`**: Expected technical interview questions with complete, structured answers.
8. **`revision-sheet.md`**: A quick cheat sheet summarizing the core concepts of the principle.
9. **`code/`**: A subdirectory containing the actual Dart source code files for the bad and good designs (`bad.dart` and `good.dart`).

---

## How to Use This Reference

1. **Initial Learning**: Study each principle sequentially, starting with its `README.md` and `theory.md` to establish the foundational concept.
2. **Practical Review**: Explore the source files under the `code/` subdirectories, run the code, and examine the terminal output.
3. **Interview Preparation**: Review the `interview-questions.md` file in each principle's directory, and study the summaries compiled in the `INTERVIEW-NOTES` directory.

This reference is optimized to make advanced software design concepts accessible and easy to recall.