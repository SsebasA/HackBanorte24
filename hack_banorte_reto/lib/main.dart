import 'package:com.banorteEduApp.app/src/CoursesPages/introduccion_financiera.dart';
import 'package:com.banorteEduApp.app/src/course_home.dart';
import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( 
 MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(), // Cambia FirstScreen por LoginScreen
    );
  }
}
