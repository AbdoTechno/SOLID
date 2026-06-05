// نقطة الانطلاق الرئيسية وتشغيل النظام (Main Entry Point)
// بتوضح تجميع كل أجزاء SOLID مع بعض في أبسط شكل ممكن شغالين بالـ DI

import 'interfaces.dart';
import 'models.dart';
import 'repositories.dart';
import 'services.dart';

void main() {
  print('================================================================');
  print('🏫 نظام إدارة شؤون طلاب الجامعة المتكامل المبسط (SOLID) 🏫');
  print('================================================================');

  // 1. تجهيز البنية التحتية (Infrastructure Setup) - DIP
  final StudentRepository studentRepo = InMemoryStudentRepository();

  // 2. تجهيز الخدمات الأساسية (Services Initialization) - SRP
  final StudentRegistry registry = StudentRegistry(studentRepo);
  final EnrollmentManager enrollmentManager = EnrollmentManager();
  final GradeBook gradeBook = GradeBook();

  // 3. إنشاء الكورسات المتوفرة
  final math = Course(code: 'MATH101', name: 'الرياضيات العامة');
  final cs = Course(code: 'CS102', name: 'أساسيات البرمجة');

  print('\n---------------------------------------------------------');
  print('=== 1. تسجيل الطلاب الجدد ===');
  
  // طالب ساعات معتمدة (Credit Student)
  final BaseStudent creditStudent = CreditStudent(
    id: 'CS-2026-001',
    name: 'حازم شريف',
  );

  // طالب مستمع (Audit Student)
  final BaseStudent auditStudent = AuditStudent(
    id: 'AU-2026-999',
    name: 'مصطفى كامل',
  );

  // تسجيل الطلاب في قاعدة البيانات المحلية
  registry.registerStudent(creditStudent);
  registry.registerStudent(auditStudent);

  print('\n---------------------------------------------------------');
  print('=== 2. تسجيل الطلاب في المواد الدراسية ===');

  // تسجيل حازم في المادتين
  enrollmentManager.enrollStudentInCourse(creditStudent, math);
  enrollmentManager.enrollStudentInCourse(creditStudent, cs);

  // تسجيل مصطفى (المستمع) في مادة البرمجة فقط
  enrollmentManager.enrollStudentInCourse(auditStudent, cs);

  print('\n---------------------------------------------------------');
  print('=== 3. رصد الدرجات ===');

  // رصد درجات حازم (Credit Student) - سيناريو ناجح
  gradeBook.assignGrade(creditStudent, math, 'A+');
  gradeBook.assignGrade(creditStudent, cs, 'A');

  // محاولة رصد درجات لمصطفى (Audit Student) - سيناريو أمان (LSP Compliant)
  // السيستم هيرفض رصد الدرجات من غير ما يعمل Crash أو يرمي Exception غريبة
  gradeBook.assignGrade(auditStudent, cs, 'B+');

  print('\n=========================================================');
  print('🎉 تم تشغيل النظام بنجاح وتأكيد توافقية الـ SOLID كاملة! 🎉');
  print('=========================================================');
}
