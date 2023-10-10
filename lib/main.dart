import 'package:dreamtier/pages/home_screen.dart';
import 'package:dreamtier/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamTier',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      home: HomeScreen(),
    );
  }
}
