import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app_provider/model/model.dart';

const STUDENT_DB = "student-db";

class ScreenProvider extends ChangeNotifier {
  List<StudentModel> studentList = [];

  Future<void> addStudent(StudentModel value) async {
    try {
      final studentDB = await Hive.openBox<StudentModel>(STUDENT_DB);
      await studentDB.add(value);
      await getStudents(); // Update the student list after adding
      notifyListeners();
    } catch (e) {
      print('Error adding student: $e');
    }
  }

  Future<void> getStudents() async {
    print(studentList);
    try {
      studentList.clear();
      final allStudents = await getAllData();
      studentList.addAll(allStudents);
      notifyListeners();
    } catch (e) {
      print('Error getting students: $e');
    }
  }

  Future<List<StudentModel>> getAllData() async {
    try {
      final db = await Hive.openBox<StudentModel>(STUDENT_DB);
      return db.values.toList();
    } catch (e) {
      print('Error getting all data: $e');
      return [];
    }
  }
}
