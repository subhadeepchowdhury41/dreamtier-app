import 'package:dreamtier/pages/dreamtier_overview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          DreamtierOverview(),
          DreamtierOverview(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey.shade700,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon:
                Icon(_currentIndex == 0 ? Icons.window : Icons.window_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Live',
            icon: Icon(_currentIndex == 1 ? Icons.live_tv_rounded : Icons.tv),
          ),
          BottomNavigationBarItem(
            label: 'My Courses',
            icon: Icon(_currentIndex == 2
                ? Icons.view_list_rounded
                : Icons.view_list_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(_currentIndex == 3
                ? Icons.person_rounded
                : Icons.person_outline),
          ),
        ],
      ),
    );
  }
}

