import 'package:com.banorteEduApp.app/src/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RegisterPage(),
    );
  }
}



class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _termsAccepted = false;
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();

  Future<void> registerUser() async {
    if (_passwordController.text != _confirmPasswordController.text){
      return;
    }

    if(!_termsAccepted){
      return;
    }

    final user = await _authService.registerUser(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(), 
      firstName: _firstNameController.text.trim(), 
      secondName: _secondNameController.text.trim(),
      );

      if (user != null){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder:  (context) => LoginPage())
        );
      } else {
        print("El registro fallo");
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
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
            SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Título
                Text("Registrate y empieza tu educación financiera",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold
  
                      ),
                ),
                SizedBox(height:20),
                
                // Nombre

                _buildTextInput('Nombre', _firstNameController),
                SizedBox(height: 10.0),

                // Apellido
                _buildTextInput('Apellido', _secondNameController),
                SizedBox(height: 10.0),

                // Correo Electrónico
                _buildTextInput('Correo electrónico', _emailController),
                SizedBox(height: 10.0),

                // Contraseña
                _buildPasswordInput('Contraseña', _passwordController, _passwordVisible, () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                }),
                SizedBox(height: 10.0),

                // Confirmar Contraseña
                _buildPasswordInput('Confirmar contraseña', _confirmPasswordController, _confirmPasswordVisible, () {
                  setState(() {
                    _confirmPasswordVisible = !_confirmPasswordVisible;
                  });
                }),
                SizedBox(height: 10.0),

                // Aceptar Términos y Condiciones
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _termsAccepted,
                      checkColor: Colors.white,
                      activeColor: banorteRed,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                      
                    ),
                    Text('Aceptar Términos y Condiciones'),
                  ],
                ),
                SizedBox(height: 20.0),

                // Botones de Atrás y Continuar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                    },
                    child: Text('Volver'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: banorteRed,
                      foregroundColor: Colors.white
                    )),
                    ElevatedButton(
                      onPressed: () async {
                      
                      await registerUser();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }, 
                    child: Text('Registrar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: banorteRed,
                      foregroundColor: Colors.white
                    )),]
                ),
              ],
            ),
          ] 
      ),
    ),
   );
  }

  // Función para construir campos de texto estándar
  Widget _buildTextInput(String labelText, TextEditingController controller) {
    return 
    
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: 
      TextField(
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: TextStyle(
                    fontFamily: 'Gotham', // Asegúrate de agregar la fuente en tu proyecto
                    fontSize: 12,
                    color: Color(0xFF5B6670),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFF5B6670)),
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
      
      );
  }

  // Función para construir campos de contraseña
  Widget _buildPasswordInput(String labelText, TextEditingController controller, bool isVisible, VoidCallback onTap) {
    return 
   Padding( 
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child:
    TextField(
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: TextStyle(
                    fontFamily: 'Gotham Book', // Asegúrate de agregar la fuente en tu proyecto
                    fontSize: 12,
                    color: Color(0xFF5B6670),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFF5B6670)),
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
      
    );
  }

  // Función para construir botones
  
}