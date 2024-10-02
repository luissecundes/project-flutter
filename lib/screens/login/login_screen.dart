import 'package:flutter/material.dart';
import 'custom_text_field.dart'; // Importando o widget CustomTextField
import 'custom_elevated_button.dart'; // Importando o widget CustomElevatedButton

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
      appBar: AppBar(
        title: const Text(
          'Mile-Express',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue, // Cor do AppBar
      ),
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
          // Centro do Card com os campos de entrada e botão
          Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      controller: _usernameController,
                      label: 'Usuário',
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      controller: _passwordController,
                      label: 'Senha',
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_usernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Login bem-sucedido!')),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Erro'),
                                content: const Text(
                                    'Por favor, preencha todos os campos.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
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
                  height: 50, // Ajuste a altura da logo conforme necessário
                ),
                const SizedBox(height: 20), // Espaço abaixo da logo
              ],
            ),
          ),
        ],
      ),
    );
  }
}
