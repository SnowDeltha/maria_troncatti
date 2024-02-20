import 'package:flutter/material.dart';

class ModuloConfiguracion extends StatefulWidget {
  static const String name = 'modulo_configuracion_screen';
  const ModuloConfiguracion({super.key});

  @override
  State<ModuloConfiguracion> createState() =>
      _ModuloConfiguracionState();
}

class _ModuloConfiguracionState extends State<ModuloConfiguracion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modulo de Configuracion'),
      ),
    );
  }
}