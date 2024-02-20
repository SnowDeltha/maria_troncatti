import 'package:flutter/material.dart';

class ModuloAsistenciaScreen extends StatefulWidget {
  static const String name = 'modulo_asistencia_screen';
  const ModuloAsistenciaScreen({super.key});

  @override
  State<ModuloAsistenciaScreen> createState() =>
      _ModuloAsistenciaScreenState();
}

class _ModuloAsistenciaScreenState extends State<ModuloAsistenciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Modulo de Asistencia'),
      ),
    );
  }
}