import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Mile-Express',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue, // Cor do AppBar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Define a altura do AppBar
}
