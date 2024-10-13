import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Cursos',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Courses(),
    );
  }
}


class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(children: [Text("hola")],)
    );
  }
}