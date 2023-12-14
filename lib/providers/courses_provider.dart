import 'package:dreamtier/models/course_model.dart';
import 'package:dreamtier/utils/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CourseState extends StateNotifier<List<Course>> {
  CourseState() : super([]);

  Future<void> fetchCourses() async {
    final availableCoursesBox =
        await Hive.openBox<Course>(HiveBoxes.availableCourses);
    final List<Course> courses = availableCoursesBox.values.toList();

    final enrolledCoursesBox =
        await Hive.openBox<Course>(HiveBoxes.enrolledCourses);
    final List<Course> enrolledCourses = enrolledCoursesBox.values.toList();

    for (var course in courses) {
      course.isEnrolled = enrolledCourses
          .any((enrolledCourse) => enrolledCourse.id == course.id);
    }

    state = courses;
  }

  void enrollCourse(Course course) {
    final enrolledCoursesBox = Hive.box<Course>(HiveBoxes.enrolledCourses);
    enrolledCoursesBox.put(course.id, course);
    state = state
        .map((c) => c.id == course.id ? c.copyWith(isEnrolled: true) : c)
        .toList();
  }
}

final courseProvider =
    StateNotifierProvider<CourseState, List<Course>>((ref) => CourseState());