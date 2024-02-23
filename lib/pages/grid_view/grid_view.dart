import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/controller.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (BuildContext context, screenProvider, _) => GridView.builder(
          itemCount: screenProvider.allStudentList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            final data = screenProvider.allStudentList[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(
                    color: Colors.black26, width: 1), // Border properties
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.deepPurple,
                    backgroundImage: FileImage(File(data.image)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Age: ${data.age}",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "Roll No : ${data.rollNo}",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
