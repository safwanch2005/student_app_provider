import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              style: GoogleFonts.poppins(color: Colors.black),
              textAlign: TextAlign.center,
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
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(color: Colors.black),
              textAlign: TextAlign.center,
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
              style: GoogleFonts.poppins(color: Colors.black),
              textAlign: TextAlign.center,
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
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black38)),
                child: const Text("Add"),
              ))
        ],
      ),
    );
  }
}
