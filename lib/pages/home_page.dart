import 'package:flutter/material.dart';
import 'package:study_planner_new/constants/colors.dart';
import 'package:study_planner_new/pages/main_screens/assignments_page.dart';
import 'package:study_planner_new/pages/main_screens/courses_page.dart';
import 'package:study_planner_new/pages/main_screens/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //bottonAppbar main pages
  static final List<Widget> _pages = [
    MainPage(),
    CoursesPage(),
    AssignmentsPage(),
  ];
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapItem,
        currentIndex: _selectedIndex,
        // Home page
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          // Course page
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Courses",
          ),
          // Assignment page
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_rounded),
            label: "Assignments",
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
