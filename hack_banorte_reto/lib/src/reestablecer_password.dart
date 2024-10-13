import 'package:flutter/material.dart';
import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:flutter/cupertino.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Column(
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
              child:CupertinoTextField(
              placeholder: "Email",
              keyboardType: TextInputType.emailAddress,
            )),
            SizedBox(height: 10),
            Text(
              'Te enviaremos un correo para reestablecer tu contraseña',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: banorteRed,
                  foregroundColor: Colors.white
                ),
                onPressed: () {
                  // Acción para enviar el correo de restablecimiento
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
