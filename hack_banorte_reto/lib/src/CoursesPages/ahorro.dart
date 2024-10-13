import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:flutter/material.dart';

class SavingsAndInvestmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ahorro e Inversión")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "¿Qué son el Ahorro y la Inversión?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: banorteRed),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.savings, color: banorteRed),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "El ahorro es la parte de tus ingresos que decides no gastar y reservar para el futuro. Por otro lado, la inversión es el proceso de utilizar tus ahorros para "
                      "generar más dinero a través de diferentes instrumentos financieros.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "¿Por qué es importante ahorrar e invertir?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 10),
              _buildInfoCard(
                "Fondo de Emergencia",
                "Ahorrar te permite crear un fondo de emergencia para imprevistos.",
              ),
              _buildInfoCard(
                "Independencia Financiera",
                "Te ayuda a ser menos dependiente de créditos y deudas.",
              ),
              _buildInfoCard(
                "Generación de Riqueza",
                "Invertir tu dinero sabiamente puede generar rendimientos y hacer crecer tu patrimonio a largo plazo.",
              ),
              _buildInfoCard(
                "Planificación para el Futuro",
                "Ahorrar e invertir te permite planificar gastos futuros, como la educación de tus hijos o tu jubilación.",
              ),
              SizedBox(height: 20),
              Text(
                "¿Cómo empezar a ahorrar e invertir?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: banorteGreen),
              ),
              SizedBox(height: 10),
              Text(
                "1. **Establece un objetivo de ahorro:** Define cuánto y para qué quieres ahorrar.\n"
                "2. **Automatiza tus ahorros:** Configura transferencias automáticas a tu cuenta de ahorros cada mes.\n"
                "3. **Investiga opciones de inversión:** Conoce los diferentes instrumentos financieros, como acciones, bonos o fondos de inversión.\n"
                "4. **Diversifica:** No pongas todos tus ahorros en un solo lugar; diversifica tus inversiones para reducir riesgos.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
