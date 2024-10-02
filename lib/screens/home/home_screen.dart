import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mile_express/design/gradient_background.dart'; // Importa o widget reutilizável

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras(); // Obter as câmeras disponíveis
      print("Câmeras disponíveis: $cameras");
      if (cameras!.isNotEmpty) {
        _controller = CameraController(cameras![0], ResolutionPreset.medium);
        await _controller!.initialize(); // Inicializa o controlador da câmera
        setState(() {}); // Atualiza a UI após a inicialização
      }
    } catch (e) {
      print("Erro ao inicializar a câmera: $e");
    }
  }

  @override
  void dispose() {
    _controller?.dispose(); // Limpa o controlador quando não for mais necessário
    super.dispose();
  }

  void _openCamera() {
    print("Botão de scanear pressionado"); // Debug
    if (_controller != null && _controller!.value.isInitialized) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraPreviewScreen(controller: _controller!),
        ),
      );
    } else {
      print("Camera not initialized"); // Mensagem de erro
      // Se a câmera não está inicializada, você pode optar por chamar _initializeCamera() novamente, se necessário.
    }
  }

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
              onPressed: _openCamera,
              child: const Text('Scanear'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/remessa');
              },
              child: const Text('Ver Remessa'),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraPreviewScreen extends StatelessWidget {
  final CameraController controller;

  const CameraPreviewScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Preview')),
      body: CameraPreview(controller),
    );
  }
}
