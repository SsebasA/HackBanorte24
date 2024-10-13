import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curso de Educación Financiera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoursePage(),
    );
  }
}

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introducción a la Educación Financiera'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con introducción
              _buildHeader(),
              SizedBox(height: 20),
              // Sección 1: Conceptos básicos
              _buildSectionTitle('Conceptos Básicos'),
              SizedBox(height: 10),
              Text(
                'La educación financiera es el proceso mediante el cual una persona adquiere el conocimiento y las habilidades necesarias para tomar decisiones informadas sobre el uso y manejo del dinero. Comprender los conceptos básicos como ingresos, gastos, ahorro, inversión y deudas es esencial para mantener una buena salud financiera. Sin estos conocimientos, es fácil caer en deudas innecesarias, vivir por encima de nuestras posibilidades o no aprovechar las oportunidades para generar riqueza a largo plazo.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Divider(height: 30, thickness: 2),
              // Sección 2: Presupuesto personal
              _buildSectionTitle('Cómo hacer un Presupuesto Personal'),
              SizedBox(height: 10),
              Text(
                'Un presupuesto personal es una herramienta que te ayuda a planificar y controlar el uso de tus ingresos y gastos. Esencialmente, un presupuesto es un plan que detalla cuánto dinero tienes, cuánto gastas y en qué lo gastas. Para hacer un presupuesto efectivo, es importante identificar todas tus fuentes de ingresos y categorizar tus gastos. Esto te permitirá visualizar en qué áreas podrías estar gastando de más y dónde podrías ajustar para ahorrar más.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'El primer paso para hacer un presupuesto es calcular tus ingresos mensuales. Esto incluye tu salario, ingresos por trabajos extras, o cualquier otra fuente de dinero. Luego, haz una lista detallada de tus gastos. Incluye categorías como vivienda, alimentos, transporte, servicios públicos, entretenimiento y ahorro. Al comparar tus ingresos con tus gastos, podrás ver si estás gastando más de lo que ganas o si tienes la capacidad de ahorrar.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Divider(height: 30, thickness: 2),
              // Sección 3: La Importancia del Ahorro
              _buildSectionTitle('La Importancia del Ahorro'),
              SizedBox(height: 10),
              Text(
                'El ahorro es fundamental para alcanzar la estabilidad financiera. Tener ahorros te permite hacer frente a gastos imprevistos, como una emergencia médica o la reparación de un coche. Además, ahorrar regularmente te ayuda a alcanzar metas financieras a largo plazo, como la compra de una vivienda, el pago de la educación de tus hijos o la jubilación.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Para empezar a ahorrar, es recomendable establecer un fondo de emergencia que cubra al menos tres a seis meses de tus gastos esenciales. Esto te dará una red de seguridad en caso de que surjan imprevistos. Una vez que tengas tu fondo de emergencia, puedes empezar a destinar tus ahorros a otras metas, como invertir para el futuro o realizar una gran compra.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Divider(height: 30, thickness: 2),
              // Material adicional y botón final
              _buildAdditionalMaterialSection(context),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Acción para completar el curso o acceder al material adicional
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('¡Curso completado!')),
                    );
                  },
                  icon: Icon(Icons.check_circle),
                  label: Text('Completar Curso'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bienvenido al curso de Introducción a la Educación Financiera',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: banorteRed,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'En este curso aprenderás los fundamentos para mejorar tu situación financiera personal y construir un futuro económico estable.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: banorteRed,
      ),
    );
  }

  Widget _buildAdditionalMaterialSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Material de Apoyo'),
        SizedBox(height: 10),
        Text(
          'Accede a material adicional para profundizar tus conocimientos:',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.file_present, color: banorteRed),
          title: Text('Guía completa de educación financiera (PDF)'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Abriendo guía en PDF...')),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.video_library, color: banorteRed),
          title: Text('Video: Cómo hacer un presupuesto eficaz'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Reproduciendo video...')),
            );
          },
        ),
      ],
    );
  }
}
