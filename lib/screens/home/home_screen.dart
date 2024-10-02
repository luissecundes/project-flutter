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
            const Text(
              'Bem-vindo à tela Home!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Ir para Configurações'),
            ),
          ],
        ),
      ),
    );
  }
}
