import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_planner_new/models/course_model.dart';

class CourseService {
  //create the firstore collection reference
  final CollectionReference courseCollection =
      FirebaseFirestore.instance.collection("courses");

  //Add a new course
  Future<void> createNewCourse(Course course) async {
    try {
      // Convert the course object to a map
      final Map<String, dynamic> data = course.toJson();

      // Add the course to the collecion
      final DocumentReference docRef = await courseCollection.add(data);

      // Update the course document with the genarated ID
      await docRef.update({'id': docRef.id});

      print("Course saved");
    } catch (error) {
      print("Error creating course: $error");
    }
  }

  // Get the all courses as a stream list of course
  Stream<List<Course>> get courses {
    try {
      return courseCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => Course.fromJSON(doc.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (error) {
      print(error);
      return Stream.empty();
    }
  }
}
