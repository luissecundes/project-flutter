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
        title: const Text('Mile-Express'),
        foregroundColor: Colors.white, // Define a cor do texto como branco
        backgroundColor: Colors
            .blue, // Você pode definir a cor do fundo do AppBar aqui também
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
                          const SnackBar(content: Text('Login bem-sucedido!')),
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
      ),
    );
  }
}
