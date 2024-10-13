import 'package:com.banorteEduApp.app/src/ChatMainScreen.dart';
import 'package:com.banorteEduApp.app/src/Services/auth.dart';
import 'package:com.banorteEduApp.app/src/home.dart';
import 'package:com.banorteEduApp.app/src/reestablecer_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'datos.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

const Color banorteRed = Color.fromARGB(255, 236, 0, 41);
const Color banorteGrey = Color.fromARGB(255, 91, 102, 112);
const Color banorteGreen = Color.fromARGB(255, 108, 192, 74);
const Color banorteOrange = Color.fromARGB(255, 245, 104, 28);
const Color banorteYellow = Color.fromARGB(255, 248, 164, 1);
const Color formGrey = Color.fromARGB(255, 246, 246, 246);

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
  bool _obscureText = true;
  final AuthService _authService = AuthService();
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 Future<void> _login() async {
  try {
    final user = await _authService.loginUser(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    
  } catch(e) {
    print("Error al iniciar sesión $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error al iniciar sesión"))
    );

  }
 }


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
                fontFamily: 'Gotham'
              ),
            ),
            SizedBox(height: 20),
            // Campo de texto para email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: 
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontFamily: 'Gotham', // Asegúrate de agregar la fuente en tu proyecto
                    fontSize: 12,
                    color: Color(0xFF5B6670),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFF5B6670)),
                    
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Acción para limpiar el campo
                    },
                  ),
                ),
      ),
              
            ),
            SizedBox(height: 20),
            // Campo de texto para contraseña
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Contraseña",
                      hintStyle: TextStyle(
                        fontFamily: 'Gotham', // Asegúrate de agregar la fuente en tu proyecto
                        fontSize: 12,
                        color: Color(0xFF5B6670),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Color(0xFF5B6670)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black
                        )
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                      
                    ),
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
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
                onPressed: _login,
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
