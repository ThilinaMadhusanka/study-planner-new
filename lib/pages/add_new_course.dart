import 'package:flutter/material.dart';
import 'package:study_planner_new/constants/colors.dart';
import 'package:study_planner_new/widgets/custum_input.dart';

class AddNewCourse extends StatelessWidget {
  AddNewCourse({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _courseDurationController =
      TextEditingController();
  final TextEditingController _courseSheduleController =
      TextEditingController();
  final TextEditingController _courseInstructorController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add new course",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Quisque vehicula, erat in facilisis viverra, libero justo fermentum purus",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustumInput(
                  lableText: "Course name",
                  controller: TextEditingController(),
                  //validator: (p0) {},
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Description",
                  controller: TextEditingController(),
                  //validator: (p0) {},
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Duration",
                  controller: TextEditingController(),
                  //validator: (p0) {},
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Shedule",
                  controller: TextEditingController(),
                  //validator: (p0) {},
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Instructor",
                  controller: TextEditingController(),
                  //validator: (p0) {},
                  //key: GlobalKey(),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    "Add Course",
                    style: TextStyle(
                      backgroundColor: primaryColor,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
