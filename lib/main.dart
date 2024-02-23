import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/controller/controller.dart';
import 'package:student_app_provider/model/model.dart';
import 'package:student_app_provider/splash_screen/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await openHiveBoxes();
  runApp(const MyApp());
}

Future<void> openHiveBoxes() async {
  if (!Hive.isBoxOpen(STUDENT_DB)) {
    await Hive.openBox<StudentModel>(STUDENT_DB);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplachScreen(),
      ),
    );
  }
}
