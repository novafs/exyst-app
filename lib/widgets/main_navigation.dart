import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/explore_screen.dart';
import '../screens/course/my_courses_screen.dart';
import '../screens/profile/user_profile_screen.dart';
import 'bottom_navigation.dart';

class MainNavigation extends StatefulWidget {
  final int initialIndex;

  const MainNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  late PageController _pageController;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const MyCoursesScreen(),
    const UserProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
