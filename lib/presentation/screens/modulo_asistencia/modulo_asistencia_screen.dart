import 'package:flutter/material.dart';

class ModuloAsistenciaScreen extends StatefulWidget {
  static const String name = 'modulo_asistencia_screen';
  const ModuloAsistenciaScreen({super.key});

  @override
  State<ModuloAsistenciaScreen> createState() => _ModuloAsistenciaScreenState();
}

class _ModuloAsistenciaScreenState extends State<ModuloAsistenciaScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Modulo de Asistencia'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 150,
            ),
            child: Text(
              "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",
            ),
          ),
          ElevatedButton(
            child: const Text("Seleccione Fecha"),
            onPressed: () async {
              final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
