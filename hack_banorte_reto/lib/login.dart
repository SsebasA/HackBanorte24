import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Página de Inicio de Sesión',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Parte superior con el logo
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.assessment, // Cambia este icono por el que desees
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 40),
          // Título
          Text(
            'Inicia tu educación financiera',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // Campo de texto para email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Campo de texto para contraseña
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Botón de iniciar sesión
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión
              },
              child: Text('Iniciar Sesión'),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Texto de registro
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¿No tienes cuenta?'),
              TextButton(
                onPressed: () {
                  // Lógica para registrarse
                },
                child: Text('Regístrate'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
