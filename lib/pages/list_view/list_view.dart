import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_provider/pages/details_page/details_page.dart';

// ignore: must_be_immutable
class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const DetailsPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(
                    color: Colors.black45, width: 1), // Border properties
                borderRadius: BorderRadius.circular(40),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person),
                ),
                title: Text("safwan", style: GoogleFonts.poppins(fontSize: 23)),
                subtitle: Text("age : 19",
                    style: GoogleFonts.poppins(color: Colors.black54)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: () {}, child: const Icon(Icons.edit_outlined)),
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {}, child: const Icon(Icons.delete)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
