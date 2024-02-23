import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/controller.dart';
import 'package:student_app_provider/controller/index_provider.dart';
import 'package:student_app_provider/pages/details_page/details_page.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (BuildContext context, screenProvider, _) => ListView.builder(
          itemCount: screenProvider.allStudentList.length,
          itemBuilder: (context, index) {
            final data = screenProvider.allStudentList[index];
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
                  leading: CircleAvatar(
                    radius: 32,
                    backgroundImage: FileImage(File(data.image)),
                  ),
                  title: Text(
                    data.name,
                    style: GoogleFonts.poppins(fontSize: 23),
                  ),
                  subtitle: Text("age : ${data.age.toString()}",
                      style: GoogleFonts.poppins(color: Colors.black54)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          IndexProvider().changeIndex(2);
                          print("///////");
                          // screenProvider.updateImage(data.image);
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (ctx) {
                          //   return EditStudent(
                          //       name: data.name,
                          //       age: data.age,
                          //       std: data.rollNo,
                          //       place: data.parentNumber,
                          //       image: data.image,
                          //       id: data.id!);
                          // }));
                        },
                        child: const Icon(Icons.edit_outlined),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: const Text('Delete',
                                    style: TextStyle(color: Colors.deepPurple)),
                                content: const Text(
                                  'Confirm ?',
                                  style: TextStyle(color: Colors.deepPurple),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await screenProvider
                                          .deleteStudent(data.id!);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Deleted Successfully'),
                                        backgroundColor: Colors.deepPurple,
                                        behavior: SnackBarBehavior.floating,
                                      ));
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
