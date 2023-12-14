import 'package:dreamtier/models/course_model.dart';
import 'package:dreamtier/pages/home/courses/courses_details_screen.dart';
import 'package:dreamtier/providers/courses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesListScreen extends ConsumerWidget {
  const CoursesListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses List'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text(course.description),
            trailing: course.isEnrolled ? const Text('Enrolled') : null,
            onTap: () async {
              await Navigator.of(context)
                  .push(CourseDetailsPageRoute(course: course));
            },
          );
        },
      ),
    );
  }
}

class CourseDetailsPageRoute extends MaterialPageRoute {
  CourseDetailsPageRoute({required Course course})
      : super(builder: (BuildContext context) => CourseDetailsScreen(course: course));

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}