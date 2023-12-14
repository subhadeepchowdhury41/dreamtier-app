import 'package:hive/hive.dart';

part 'course_model.g.dart';

@HiveType(typeId: 0)
class Course {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String instructor;

  @HiveField(4)
  final DateTime startDate;

  @HiveField(5)
  final DateTime endDate;

  @HiveField(6)
  final String meetingLink;

  @HiveField(7)
  bool isEnrolled;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.startDate,
    required this.endDate,
    required this.meetingLink,
    this.isEnrolled = false,
  });

  Course copyWith({required bool isEnrolled}) {
    return Course(
      id: id,
      title: title,
      description: description,
      instructor: instructor,
      startDate: startDate,
      endDate: endDate,
      meetingLink: meetingLink,
      isEnrolled: isEnrolled,
    );
  }
}