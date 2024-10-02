import 'package:flutter/material.dart';
import 'login_app_bar.dart'; // Importando o widget LoginAppBar
import 'login_form.dart'; // Importando o widget LoginForm

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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(), // Usando o widget LoginAppBar
      body: Stack(
        children: [
          // Container de fundo com gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Formulário de login
          Center(
            child: LoginForm( // Usando o widget LoginForm
              usernameController: _usernameController,
              passwordController: _passwordController,
            ),
          ),
          // Imagem da logo na parte inferior, ajustando a altura
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20), // Ajuste essa altura conforme necessário
                Image.asset(
                  'assets/images/mile-logo.png', // Caminho para sua logo
                  fit: BoxFit.contain,
                  height:50, // Ajuste a altura da logo conforme necessário
                ),
                const SizedBox(height: 30), // Espaço abaixo da logo
              ],
            ),
          ),
        ],
      ),
    );
  }
}
