import 'package:com.banorteEduApp.app/src/ChatMainScreen.dart';
import 'package:com.banorteEduApp.app/src/chat.dart';
import 'package:com.banorteEduApp.app/src/course_home.dart';
import 'package:com.banorteEduApp.app/src/courses.dart';
import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:com.banorteEduApp.app/src/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    ChatScreen(),
    RoadmapScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == -1 // -1 indica que estamos en la pantalla de login
          ? LoginScreen()
          : _pages[_currentIndex],
      bottomNavigationBar: _currentIndex == -1 // No mostrar el navbar en la pantalla de login
          ? null
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Cursos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
              selectedItemColor: Colors.red, // Color rojo para el ícono seleccionado
              unselectedItemColor: Colors.grey, // Color gris para los íconos no seleccionados
            ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Iniciar Sesión',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
