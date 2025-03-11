import 'package:flutter/material.dart';
import 'package:study_planner_new/models/course_model.dart';

class SingleCoursePage extends StatelessWidget {
  final Course course;
  const SingleCoursePage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Instructor : ${course.instructor}",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Duration : ${course.duration}",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Schedule : ${course.schedule}",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              course.instructor,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
