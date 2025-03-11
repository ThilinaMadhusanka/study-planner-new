import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner_new/constants/colors.dart';
import 'package:study_planner_new/services/course_service.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Study Planner",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //add course
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push("/add-new-course");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Course",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Your study planner helps you to keep track of your study progress and manage your time effectively",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Courses",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Your running subjects",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                  stream: CourseService().courses,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error :${snapshot.error}"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 5,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/a.png",
                                width: 200,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "No courses available. Feel free to add a course!",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      final courses = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return Card(
                            elevation: 0,
                            color: lightGreen,
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: ListTile(
                              title: Text(
                                course.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: Text(
                                course.description,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                GoRouter.of(context).push(
                                  "/single-course",
                                  extra: course,
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
