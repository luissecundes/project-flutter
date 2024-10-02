import 'package:flutter/material.dart';
import 'package:mile_express/design/gradient_background.dart'; // Importa o widget reutilizável

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      title: 'Home', // Título do AppBar
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scan');
              },
              child: const Text('Scanear Código de Barras'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shipments');
              },
              child: const Text('Ver Remessa'),
            ),
          ],
        ),
      ),
    );
  }
}
