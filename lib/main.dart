import 'package:dreamtier/firebase_options.dart';
import 'package:dreamtier/pages/home/profile/interests_selector.dart';
import 'package:dreamtier/pages/home/profile/pfp_upload.dart';
import 'package:dreamtier/pages/home/profile/work_details.dart';
import 'package:dreamtier/pages/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
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
      home: const WorkDetailsScreen(),
      // home: HomeScreen(),
    );
  }
}
