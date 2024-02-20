import 'package:flutter/material.dart';

class RegistroAsistenciaScreen extends StatefulWidget {
  static const String name = 'registro_asistencia_screen';
  const RegistroAsistenciaScreen({super.key});

  @override
  State<RegistroAsistenciaScreen> createState() =>
      _RegistroAsistenciaScreenState();
}

class _RegistroAsistenciaScreenState extends State<RegistroAsistenciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Registro de Asistecia'),
      ),
    );
  }
}