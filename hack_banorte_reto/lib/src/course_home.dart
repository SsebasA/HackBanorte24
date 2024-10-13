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
      home: RoadmapScreen(),
    );
  }
}

class RoadmapScreen extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('Roadmap de Cursos de Educación Financiera'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: CourseCard(course: course),
          );
        },
      ),
    );
  }
}

class Course {
  final String title;
  final CourseStatus status;

  Course({required this.title, required this.status});
}

enum CourseStatus { completed, inProgress, notStarted }

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    Icon courseIcon;

    switch (course.status) {
      case CourseStatus.completed:
        cardColor = Colors.green;
        courseIcon = Icon(Icons.check_circle, color: Colors.white);
        break;
      case CourseStatus.inProgress:
        cardColor = Colors.orange;
        courseIcon = Icon(Icons.pending, color: Colors.white);
        break;
      case CourseStatus.notStarted:
      default:
        cardColor = Colors.grey;
        courseIcon = Icon(Icons.circle, color: Colors.white);
        break;
    }

    return Card(
      color: cardColor,
      elevation: 4,
      child: ListTile(
        leading: courseIcon,
        title: Text(
          course.title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.white),
        onTap: () {
          // Acción al pulsar el curso
          // Aquí puedes agregar la lógica para abrir detalles del curso
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Iniciando curso: ${course.title}')),
          );
        },
      ),
    );
  }
}
