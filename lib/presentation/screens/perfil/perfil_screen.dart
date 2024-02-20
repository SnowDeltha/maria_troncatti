import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  static const name = 'perfil_screen';
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
    );
  }
}
