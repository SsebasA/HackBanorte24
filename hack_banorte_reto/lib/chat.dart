import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selección de Tema',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Selección de Tema'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Cuadro de texto superior
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Selecciona un tema de interés',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.0),
            // Cuatro botones
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildOptionButton(context, 'Opción 1'),
                _buildOptionButton(context, 'Opción 2'),
                _buildOptionButton(context, 'Opción 3'),
                _buildOptionButton(context, 'Opción 4'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Función para construir los botones
  Widget _buildOptionButton(BuildContext context, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300], // Color del botón
        foregroundColor: Colors.black,     // Color del texto
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(24.0),
      ),
      onPressed: () {
        // Acción al presionar el botón
        print('$text presionado');
      },
      child: Text(text),
    );
  }
}
