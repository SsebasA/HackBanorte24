import 'package:com.banorteEduApp.app/src/CoursesPages/ahorro.dart';
import 'package:com.banorteEduApp.app/src/CoursesPages/introduccion_financiera.dart';
import 'package:com.banorteEduApp.app/src/CoursesPages/presupuesto.dart';
import 'package:flutter/material.dart';
import 'package:com.banorteEduApp.app/src/login.dart'; // Asegúrate de que este archivo esté correcto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Education Roadmap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseListScreen(),
    );
  }
}

class Course {
  final String title;
  final CourseStatus status;
  final Widget Function(BuildContext) detailScreen; // Función que devuelve la pantalla de detalles

  Course({required this.title, required this.status, required this.detailScreen});
}

enum CourseStatus { completed, inProgress, notStarted }

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: "Introducción a la Educación Financiera",
      status: CourseStatus.completed,
      detailScreen: (context) => CoursePage(), // Coloca aquí la ruta o referencia a la pantalla de detalles
    ),
    Course(
      title: "Presupuesto Personal",
      status: CourseStatus.inProgress,
      detailScreen: (context) => PersonalBudgetScreen(), // Coloca aquí la ruta o referencia a la pantalla de detalles
    ),
    Course(
      title: "Ahorro e Inversión",
      status: CourseStatus.notStarted,
      detailScreen: (context) => SavingsAndInvestmentScreen(), // Coloca aquí la ruta o referencia a la pantalla de detalles
    ),
    // Agrega más cursos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red, // Usa un color si banorteRed no está definido
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250),
                bottomRight: Radius.circular(250),
              ),
            ),
            child: Center(
              child: Text(
                "Cursos de Educación Financiera",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Gotham'),
              ),
            ),
          ),
          SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return ListTile(
                  title: Text(course.title),
                  subtitle: Text(_getCourseStatusText(course.status)),
                  trailing: Icon(_getCourseStatusIcon(course.status)),
                  onTap: () {
                    // Navegar a la pantalla del curso
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: course.detailScreen),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getCourseStatusText(CourseStatus status) {
    switch (status) {
      case CourseStatus.completed:
        return 'Completado';
      case CourseStatus.inProgress:
        return 'En progreso';
      case CourseStatus.notStarted:
        return 'No iniciado';
      default:
        return '';
    }
  }

  IconData _getCourseStatusIcon(CourseStatus status) {
    switch (status) {
      case CourseStatus.completed:
        return Icons.check_circle;
      case CourseStatus.inProgress:
        return Icons.autorenew;
      case CourseStatus.notStarted:
      default:
        return Icons.hourglass_empty;
    }
  }
}
