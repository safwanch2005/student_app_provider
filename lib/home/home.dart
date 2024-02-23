import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/controller.dart';
import 'package:student_app_provider/controller/index_provider.dart';
import 'package:student_app_provider/pages/add_student_page/add_student.dart';
import 'package:student_app_provider/pages/grid_view/grid_view.dart';
import 'package:student_app_provider/pages/list_view/list_view.dart';
import 'package:student_app_provider/pages/search_page/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    const ListViewPage(),
    const GridViewPage(),
    AddStudentPage(),
    const SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ScreenProvider>(
        builder: (BuildContext context, screenProvider, _) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.deepPurple,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  " STUDENT MANAGER",
                  style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "Total : ${screenProvider.allStudentList.length} ",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          body: Consumer<IndexProvider>(
              builder: (BuildContext context, value, _) =>
                  Container(child: pages[value.index])),
          backgroundColor: Colors.deepPurple,
          bottomNavigationBar: Consumer<IndexProvider>(
            builder: (BuildContext context, value, _) =>
                GNav(color: Colors.black, tabs: [
              GButton(
                backgroundColor: Colors.black12,
                icon: Icons.list_rounded,
                text: 'List View',
                onPressed: () {
                  value.changeIndex(0);
                },
              ),
              GButton(
                backgroundColor: Colors.black26,
                icon: Icons.grid_view_rounded,
                text: 'Grid View',
                onPressed: () {
                  value.changeIndex(1);
                },
              ),
              GButton(
                backgroundColor: Colors.black26,
                icon: Icons.add,
                text: 'add',
                onPressed: () {
                  value.changeIndex(2);
                },
              ),
              GButton(
                backgroundColor: Colors.black26,
                icon: Icons.search,
                text: 'search',
                onPressed: () {
                  value.changeIndex(3);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
