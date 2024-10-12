import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Título
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.red,
              child: Row(
                children: [
                  Text(
                    'Crear una cuenta:',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),

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
                _buildActionButton('Atrás', Colors.red, Colors.white, false),
                _buildActionButton('Continuar', Colors.red, Colors.white, _termsAccepted),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Función para construir campos de texto estándar
  Widget _buildTextInput(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }

  // Función para construir campos de contraseña
  Widget _buildPasswordInput(String labelText, TextEditingController controller, bool isVisible, VoidCallback onTap) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onTap,
        ),
      ),
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