import 'package:flutter/material.dart';

class ModuloAsistenciaScreen extends StatefulWidget {
  static const String name = 'modulo_asistencia_screen';
  const ModuloAsistenciaScreen({super.key});

  @override
  State<ModuloAsistenciaScreen> createState() => _ModuloAsistenciaScreenState();
}

class _ModuloAsistenciaScreenState extends State<ModuloAsistenciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modulo de Asistencia'),
        backgroundColor: Colors.yellow,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8.0),
                children: const [
                  
                ],
              ),
            ),
          ),
          // Pie de página
          Container(
            color: Colors.green,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: const Text(
              '©2024 Instituto Tecnológico Superior Japón',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
