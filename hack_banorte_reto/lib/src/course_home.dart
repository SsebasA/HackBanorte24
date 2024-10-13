import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:flutter/material.dart';

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

  Course({required this.title, required this.status});
}

enum CourseStatus { completed, inProgress, notStarted }

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(title: "Introducción a la Educación Financiera", status: CourseStatus.completed),
    Course(title: "Presupuesto Personal", status: CourseStatus.inProgress),
    Course(title: "Ahorro e Inversión", status: CourseStatus.notStarted),
    Course(title: "Planificación para la Jubilación", status: CourseStatus.notStarted),
    Course(title: "Deuda y Crédito", status: CourseStatus.completed),
    Course(title: "Inversiones Avanzadas", status: CourseStatus.notStarted),
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
              color: banorteRed, // Usando un color en lugar de banorteRed si no está definido
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
          // Aquí está la corrección: ListView.builder envuelto en Expanded
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
                    // Acción al seleccionar un curso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Seleccionaste: ${course.title}')),
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
