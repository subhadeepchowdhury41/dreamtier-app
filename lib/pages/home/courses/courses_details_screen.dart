import 'package:dreamtier/models/course_model.dart';
import 'package:dreamtier/providers/courses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailsScreen extends ConsumerWidget {
  final Course course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(course.description),
            const SizedBox(height: 16),
            Text('Instructor: ${course.instructor}'),
            const SizedBox(height: 8),
            Text('Start Date: ${course.startDate.toLocal()}'),
            const SizedBox(height: 8),
            Text('End Date: ${course.endDate.toLocal()}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: course.isEnrolled
                  ? null
                  : () {
                      ref
                          .read(courseProvider.notifier)
                          .enrollCourse(course);
                      Navigator.pop(context);
                    },
              child: Text(course.isEnrolled ? 'Enrolled' : 'Enroll Now'),
            ),
          ],
        ),
      ),
    );
  }
}