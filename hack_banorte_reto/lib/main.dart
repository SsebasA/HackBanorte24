import 'package:flutter/material.dart';
import 'package:hack_banorte_reto/chat.dart';
import 'package:hack_banorte_reto/ChatMainScreen.dart';
import 'package:hack_banorte_reto/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Cambia FirstScreen por LoginScreen
    );
  }
}
