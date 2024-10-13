import 'package:com.banorteEduApp.app/src/Services/auth.dart';
import 'package:com.banorteEduApp.app/src/update_email.dart';
import 'package:com.banorteEduApp.app/src/update_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:com.banorteEduApp.app/src/login.dart';


void main() {
  runApp(MyApp());
}



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = _authService.getCurrentUser();
    final userName = user?.displayName ?? "Usuario"; // Usa un valor predeterminado si no hay nombre

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: banorteRed,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(300),
                bottomRight: Radius.circular(300),
              ),
            ),
            child: Center(
              child: Text("Tu Perfil",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Gotham')),
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Text("Bienvenido, $userName",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Configuración del perfil",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // Resto de tu código...
            ],
          ),
          // Resto del Scaffold...
        ],
      ),
    );
  }
}

