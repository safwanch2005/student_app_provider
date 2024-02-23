import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_provider/controller/controller.dart';
import 'package:student_app_provider/model/model.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameEdditingController = TextEditingController();
  final _ageEdditingController = TextEditingController();
  final _rollNoEdditingController = TextEditingController();
  final _parentNumberEdditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Text(
              "ADD NEW\n\t\t\tSTUDENT",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: TextFormField(
                controller: _nameEdditingController,
                style: GoogleFonts.poppins(color: Colors.black),
                textAlign: TextAlign.center,
                validator: (value) =>
                    value!.isEmpty ? "enter student name" : null,
                decoration: InputDecoration(
                  hintText: 'student name',
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: TextFormField(
                controller: _rollNoEdditingController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.poppins(color: Colors.black),
                textAlign: TextAlign.center,
                validator: (value) =>
                    value!.isEmpty ? "enter student age" : null,
                decoration: InputDecoration(
                  hintText: 'roll number',
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: TextFormField(
                controller: _ageEdditingController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "enter roll number" : null,
                style: GoogleFonts.poppins(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'age',
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: TextFormField(
                controller: _parentNumberEdditingController,
                keyboardType: TextInputType.phone,
                style: GoogleFonts.poppins(color: Colors.black),
                textAlign: TextAlign.center,
                validator: (value) =>
                    value!.isEmpty ? "enter parent number" : null,
                decoration: InputDecoration(
                  hintText: 'parent mobile number',
                  hintStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: Colors.black45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.black45),
                  ),
                  // const CircleAvatar(
                  //   backgroundColor: Colors.black12,
                  //   radius: 20,
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon:
                  //       const Icon(Icons.highlight_remove, color: Colors.black45),
                  // ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    final name = _nameEdditingController.text;
                    final age = _ageEdditingController.text;
                    final rollNo = _rollNoEdditingController.text;
                    final parentNumber = _parentNumberEdditingController.text;
                    if (name.isEmpty ||
                        age.isEmpty ||
                        rollNo.isEmpty ||
                        parentNumber.isEmpty) {
                      return;
                    }
                    final value = StudentModel(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: name,
                        age: int.parse(age),
                        rollNo: int.parse(rollNo),
                        parentNumber: int.parse(parentNumber));
                    print(value);
                    ScreenProvider().addStudent(value);
                    // ScreenProvider().addStudent(value);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black38)),
                  child: const Text("Add"),
                ))
          ],
        ),
      ),
    );
  }
}
