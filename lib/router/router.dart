import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner_new/models/course_model.dart';
import 'package:study_planner_new/pages/add_new_course.dart';
import 'package:study_planner_new/pages/home_page.dart';
import 'package:study_planner_new/pages/single_course_page.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text("This page is not available"),
          ),
        ),
      );
    },
    routes: [
      //home page
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) {
          return HomePage();
        },
      ),
      //add new course
      GoRoute(
        path: "/add-new-course",
        name: "add new course",
        builder: (context, state) {
          return AddNewCourse();
        },
      ),
      //single course
      GoRoute(
        path: "/single-course",
        name: "single course",
        builder: (context, state) {
          final Course course = state.extra as Course;
          return SingleCoursePage(
            course: course,
          );
        },
      ),
    ],
  );
}
