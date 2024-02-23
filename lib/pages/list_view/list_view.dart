import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/controller.dart';
import 'package:student_app_provider/model/model.dart';
import 'package:student_app_provider/pages/details_page/details_page.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context, value, child) {
      print(value.studentList);
      return ListView.builder(
          itemCount: value.studentList.length,
          itemBuilder: (context, index) {
            print(value.studentList.length);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailsPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                      color: Colors.black45, width: 1), // Border properties
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: const EdgeInsets.all(8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    "safwan",
                    style: GoogleFonts.poppins(fontSize: 23),
                  ),
                  subtitle: Text("age : 19",
                      style: GoogleFonts.poppins(color: Colors.black54)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          final value = StudentModel(
                              id: DateTime.now().millisecondsSinceEpoch,
                              name: "safwan",
                              age: 19,
                              rollNo: 8,
                              parentNumber: 654654654);
                          Provider.of<ScreenProvider>(context, listen: false)
                              .addStudent(value);
                        },
                        child: const Icon(Icons.edit_outlined),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
