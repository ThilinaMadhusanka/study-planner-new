import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner_new/constants/colors.dart';
import 'package:study_planner_new/models/course_model.dart';
import 'package:study_planner_new/services/course_service.dart';
import 'package:study_planner_new/utils/util_functions.dart';
import 'package:study_planner_new/widgets/custum_button.dart';
import 'package:study_planner_new/widgets/custum_input.dart';

class AddNewCourse extends StatelessWidget {
  AddNewCourse({super.key});
// TextEditing controllers create
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
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      //form save
      _formKey.currentState?.save();
      // Add course to firestore or any other storage here
      try {
        // Create a new course
        final Course course = Course(
          id: "",
          name: _courseNameController.text,
          description: _courseDescriptionController.text,
          duration: _courseDurationController.text,
          schedule: _courseSheduleController.text,
          instructor: _courseInstructorController.text,
        );
        await CourseService().createNewCourse(course);

        // Show success snackBar
        if (context.mounted) {
          showSnackBar(context: context, text: "Course added successfully..!");
        }
        // Delay navigation to ensure snackBar is displayed
        await Future.delayed(
          Duration(seconds: 2),
        );

        // Navigate to the home page
        GoRouter.of(context).go("/");
      } catch (error) {
        // Show error  snackBar
        if (context.mounted) {
          showSnackBar(context: context, text: "Faild to add course");
        }
      }
    }
  }

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
                //input box
                CustumInput(
                  lableText: "Course name",
                  controller: _courseNameController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course name";
                    }
                    return null;
                  },
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Course Description",
                  controller: _courseDescriptionController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course decription";
                    }
                    return null;
                  }, //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Course Duration",
                  controller: _courseDurationController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course duration";
                    }
                    return null;
                  },
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Course Shedule",
                  controller: _courseSheduleController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course shedule";
                    }
                    return null;
                  },
                  //key: GlobalKey(),
                ),
                CustumInput(
                  lableText: "Course Instructor",
                  controller: _courseInstructorController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course instructor";
                    }
                    return null;
                  },
                  //key: GlobalKey(),
                ),
                SizedBox(
                  height: 16,
                ),
                CustumButton(
                  text: "Add Course",
                  onPressed: () {
                    _submitForm(context);
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
