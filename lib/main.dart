import 'package:flutter/material.dart';
import 'login/login_screen.dart'; 
import 'screens/segunda_tela.dart'; 

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => LoginScreen(), // Tela de Login
        '/home': (context) => const SegundaTela(), // Substitua pelo nome da sua tela principal
      },
    );
  }
}
