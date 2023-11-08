import 'package:dreamtier/pages/dreamtier_overview.dart';
import 'package:dreamtier/pages/home/profile/details/profile_view.dart';
import 'package:dreamtier/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(homeProvider.notifier).currentIndex;
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            ref.read(homeProvider.notifier).changeIndex(value);
          });
        },
        controller: _pageController,
        children: [
          Container(
            child: const Center(
              child: Text('Home'),
            ),
          ),
          Container(child: DreamtierOverview()),
          Container(
            child: const Center(
              child: Text('My Courses'),
            ),
          ),
          const ProfileViewScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            ref.read(homeProvider.notifier).changeIndex(index);
            _pageController.jumpToPage(index);
          });
        },
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey.shade700,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon:
                Icon(currentIndex == 0 ? Icons.window : Icons.window_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Live',
            icon: Icon(currentIndex == 1 ? Icons.live_tv_rounded : Icons.tv),
          ),
          BottomNavigationBarItem(
            label: 'My Courses',
            icon: Icon(currentIndex == 2
                ? Icons.view_list_rounded
                : Icons.view_list_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(currentIndex == 3
                ? Icons.person_rounded
                : Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
