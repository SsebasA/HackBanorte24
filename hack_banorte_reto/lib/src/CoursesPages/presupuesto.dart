import 'package:flutter/material.dart';

class PersonalBudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Presupuesto Personal")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "¿Qué es un Presupuesto Personal?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.account_balance, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Un presupuesto personal es una herramienta que te ayuda a administrar tus finanzas. Te permite tener una visión clara de tus ingresos y gastos, "
                      "lo que facilita el control de tu dinero y la planificación de tus objetivos financieros.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "¿Por qué es importante?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 10),
              _buildInfoCard(
                "Control de Gastos",
                "Te permite saber exactamente a dónde va tu dinero cada mes.",
              ),
              _buildInfoCard(
                "Ahorro Efectivo",
                "Te ayuda a identificar áreas donde puedes reducir gastos y ahorrar.",
              ),
              _buildInfoCard(
                "Planificación Financiera",
                "Facilita la preparación para gastos futuros, como vacaciones o emergencias.",
              ),
              _buildInfoCard(
                "Objetivos Financieros",
                "Te ayuda a establecer y alcanzar metas financieras, como comprar una casa o ahorrar para la jubilación.",
              ),
              SizedBox(height: 20),
              Text(
                "¿Cómo hacer un presupuesto personal?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              SizedBox(height: 10),
              Text(
                "1. **Registra tus ingresos:** Anota todas las fuentes de ingresos, como salario, freelance, etc.\n"
                "2. **Lista tus gastos:** Haz una lista de todos tus gastos mensuales, clasificándolos en fijos (alquiler, servicios) y variables (comida, ocio).\n"
                "3. **Calcula la diferencia:** Resta tus gastos totales de tus ingresos totales para ver si tienes superávit o déficit.\n"
                "4. **Ajusta según sea necesario:** Si estás gastando más de lo que ingresas, busca maneras de reducir gastos o aumentar tus ingresos.",
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
