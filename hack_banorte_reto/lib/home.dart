import 'package:com.banorteEduApp.app/chat.dart';
import 'package:com.banorteEduApp.app/courses.dart';
import 'package:com.banorteEduApp.app/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    ChatPage(),
    CoursesPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'cursos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'perfil',
          ),
        ]),
    );
  }
}