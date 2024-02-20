import 'package:flutter/material.dart';

class AdministracioAulasScreen extends StatefulWidget {
  static const String name = 'administracion_aulas_screen';
  const AdministracioAulasScreen({super.key});

  @override
  State<AdministracioAulasScreen> createState() =>
      _AdministracioAulasScreenState();
}

class _AdministracioAulasScreenState extends State<AdministracioAulasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion de Aulas'),
      ),
    );
  }
}
