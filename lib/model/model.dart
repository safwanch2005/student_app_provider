import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;
  @HiveField(3)
  final int rollNo;
  @HiveField(4)
  final int parentNumber;
  StudentModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.rollNo,
      required this.parentNumber});

  @override
  String toString() {
    return "{$id $name $age $rollNo $parentNumber}";
  }
}
