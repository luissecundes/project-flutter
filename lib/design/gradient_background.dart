import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child; // Conteúdo da tela
  final String? title; // Título opcional para o AppBar

  const GradientBackground({
    Key? key,
    required this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(
                title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Deixa a AppBar transparente para se integrar com o gradiente
              backgroundColor: Colors.blue, // Cor do início do gradiente
              elevation: 0, // Remove sombra da AppBar
            )
          : null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
