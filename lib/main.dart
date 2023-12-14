import 'package:dreamtier/firebase_options.dart';
import 'package:dreamtier/models/course_model.dart';
import 'package:dreamtier/pages/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'utils/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
  Hive.registerAdapter(CourseAdapter());
  await Hive.openBox<Course>(HiveBoxes.availableCourses);
  await Hive.openBox<Course>(HiveBoxes.enrolledCourses);

  _initializeAvailableCourses();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

void _initializeAvailableCourses() async {
  final availableCoursesBox = await Hive.openBox<Course>(HiveBoxes.availableCourses);

  // Check if the box is empty before adding default courses
  if (availableCoursesBox.isEmpty) {
    final defaultCourses = [
      Course(
        id: '1',
        title: 'Introduction to Flutter',
        description: 'Learn the basics of Flutter development.',
        instructor: 'John Doe',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 30)),
        meetingLink: 'https://example.com/flutter-intro',
      ),
      Course(
        id: '2',
        title: 'Advanced Dart Programming',
        description: 'Explore advanced Dart language features.',
        instructor: 'Jane Smith',
        startDate: DateTime.now().add(const Duration(days: 10)),
        endDate: DateTime.now().add(const Duration(days: 40)),
        meetingLink: 'https://example.com/advanced-dart',
      ),
      Course(
        id: '3',
        title: 'Mobile App Design Principles',
        description: 'Learn key principles of designing mobile apps.',
        instructor: 'Alice Johnson',
        startDate: DateTime.now().add(const Duration(days: 20)),
        endDate: DateTime.now().add(const Duration(days: 50)),
        meetingLink: 'https://example.com/app-design',
      ),
      Course(
        id: '4',
        title: 'State Management in Flutter',
        description: 'Master state management techniques in Flutter.',
        instructor: 'Bob Williams',
        startDate: DateTime.now().add(const Duration(days: 15)),
        endDate: DateTime.now().add(const Duration(days: 45)),
        meetingLink: 'https://example.com/state-management',
      ),
      // Add more default courses as needed
    ];

    availableCoursesBox.addAll(defaultCourses);
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamTier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      home: const OnboardingScreen(),
      // home: HomeScreen(),
    );
  }
}
