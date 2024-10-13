import 'package:com.banorteEduApp.app/ChatMainScreen.dart';
import 'package:com.banorteEduApp.app/reestablecer_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'datos.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

const Color banorteRed = Color.fromARGB(255, 236, 0, 41);

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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // Estado para ocultar/mostrar la contraseña

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Alternar la visibilidad
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Envuelve el Column en un SingleChildScrollView
        child: Column(
          children: [
            // Parte superior con el logo
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: banorteRed,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(245),
                  bottomRight: Radius.circular(245),
                ),
              ),
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            SizedBox(height: 50),
            // Título
            Text(
              'Hola, bienvenido de vuelta!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Campo de texto para email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CupertinoTextField(
                placeholder: "Email",
              ),
            ),
            SizedBox(height: 20),
            // Campo de texto para contraseña
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  CupertinoTextField(
                    obscureText: _obscureText,
                    placeholder: "Contraseña",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  // Botón para mostrar/ocultar contraseña
                  IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Botón de iniciar sesión
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para iniciar sesión
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
                child: Text('Iniciar Sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: banorteRed,
                  foregroundColor: Colors.white,
                  shadowColor: banorteRed,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text('Regístrate'),
                  style: TextButton.styleFrom(
                    foregroundColor: banorteRed,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Lógica para recuperar contraseña
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                    );
                  },
                  child: Text("Olvidé mi contraseña"),
                  style: TextButton.styleFrom(
                    foregroundColor: banorteRed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
