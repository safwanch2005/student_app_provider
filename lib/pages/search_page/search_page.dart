import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_provider/pages/details_page/details_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: TextFormField(
            style: GoogleFonts.poppins(color: Colors.black),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'search students',
              hintStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(33.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.person),
                      ),
                      title: Text("safwan",
                          style: GoogleFonts.poppins(fontSize: 23)),
                      subtitle: Text("age : 19",
                          style: GoogleFonts.poppins(color: Colors.black54)),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit_outlined),
                          SizedBox(width: 20),
                          Icon(Icons.delete),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
