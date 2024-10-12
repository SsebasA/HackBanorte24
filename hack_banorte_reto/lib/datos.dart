import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MyApp());
}
const Color banorteRed = Color.fromARGB(255, 236, 0, 41);

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

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                Text("Registrate",
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold
                      ),
                ),
                SizedBox(height:20),
                
                // Nombre

                _buildTextInput('Nombre'),
                SizedBox(height: 10.0),

                // Apellido
                _buildTextInput('Apellido'),
                SizedBox(height: 10.0),

                // Correo Electrónico
                _buildTextInput('Correo electrónico'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionButton('Atrás', banorteRed, Colors.white, false),
                    _buildActionButton('Continuar', banorteRed, Colors.white, _termsAccepted),
                  ],
                ),
              ],
            ),
          ] 
      ),
    ),
   );
  }

  // Función para construir campos de texto estándar
  Widget _buildTextInput(String labelText) {
    return CupertinoTextField(
     placeholder: labelText,
    );
  }

  // Función para construir campos de contraseña
  Widget _buildPasswordInput(String labelText, TextEditingController controller, bool isVisible, VoidCallback onTap) {
    return CupertinoTextField(
      controller: controller,
      obscureText: !isVisible,
      placeholder: labelText,
    );
  }

  // Función para construir botones
  Widget _buildActionButton(String text, Color backgroundColor, Color textColor, bool isEnabled) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? backgroundColor : Colors.grey, // Deshabilita el botón si no está habilitado
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: isEnabled ? () {
        // Acción del botón
        print('$text presionado');
      } : null, // Si no está habilitado, el botón no se puede presionar
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}