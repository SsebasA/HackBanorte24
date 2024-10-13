import 'package:flutter/material.dart';
import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(RestorePassword());
}

class RestorePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResetPasswordScreen(),
    );
  }
}

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _sendPasswordResetEmail() async {
    String email = _emailController.text;

    if (email.isEmpty) {
      // Aquí puedes mostrar un mensaje de error al usuario
      print("Por favor ingresa tu email");
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("Email de recuperación enviado a $email");
      // Aquí puedes mostrar un mensaje de éxito al usuario
    } catch (e) {
      print("Error al enviar el email de recuperación: $e");
      // Aquí puedes manejar el error y mostrar un mensaje adecuado
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
          SizedBox(height: 40),
          Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: CupertinoTextField(
              controller: _emailController,
              placeholder: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Te enviaremos un correo para reestablecer tu contraseña',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: banorteRed,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await _sendPasswordResetEmail(); // Enviar el correo de recuperación
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Text('Restablecer contraseña'),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
