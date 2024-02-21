import 'package:flutter/material.dart';

class RegistroAsistenciaScreen extends StatefulWidget {
  static const String name = 'registro_asistencia_screen';
  const RegistroAsistenciaScreen({super.key});

  @override
  State<RegistroAsistenciaScreen> createState() =>
      _RegistroAsistenciaScreenState();
}

class _RegistroAsistenciaScreenState extends State<RegistroAsistenciaScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal:70,
            ),
            child: Text('Registro de Asistencia',
            style: TextStyle(
            ),
            ),
          ),
          
          backgroundColor: Colors.yellow,
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

          const DataTableExample(),

          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
          ),
          // Pie de página
          Container(
            color: Colors.green,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: const Text(
              '©2024 Instituto Tecnológico Superior Japón',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),


        ],
        ),
      ),
    );
  }
}

// Aqui empieza la tabla de datos 
class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'A',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'FJ',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ), 
        DataColumn(
          label: Expanded(
            child: Text(
              'FI',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alumno')),
            DataCell(Text('x')),
            DataCell(Text('')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alumno')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alumno')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('x')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alumno')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
      ],
    );
  }
}

  
