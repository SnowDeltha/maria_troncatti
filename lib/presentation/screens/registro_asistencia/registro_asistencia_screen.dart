import 'package:flutter/material.dart';
import '../../../model/apirespuesta.dart';
import '../../../api/ConsumoApi.dart';

class RegistroAsistenciaScreen extends StatefulWidget {
  static const String name = 'registro_asistencia_screen';
  const RegistroAsistenciaScreen();

  @override
  State<RegistroAsistenciaScreen> createState() =>
      _RegistroAsistenciaScreenState();

      

}

class _RegistroAsistenciaScreenState extends State<RegistroAsistenciaScreen> {
  DateTime selectedDate = DateTime.now();
  List<dynamic> registrosList = [];
  String? error;
  late bool _isLoading;

  Future<void> mostrarRegistros() async {
    _isLoading = true;
    ApiRespuesta res =
        await CallApi().getRegistros('');
    if (res.error == null) {
      setState(() {
        registrosList = res.data as List<dynamic>;
      });
    } else {
      setState(() {
        error = res.error;
      });
    }
    _isLoading = false;
  }


   @override
  void initState() {
    mostrarRegistros();
    super.initState();
  }

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
              vertical: 30,
              horizontal: 0,
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

          const SizedBox(
                width: 0,
                height: 10,
              ),

          Expanded(
            child: Center(
              child: GridView.count( 
                shrinkWrap: false,
                crossAxisCount: 1,

                children: const [
                                   
                  DataTableRegistro(),
                  
                ],
              ),
            ),
          ),

          const SizedBox(
                width: 0,
                height: 10,
              ),

          const BotonPersonalizado2(),

           const Expanded(
            child: SizedBox(
                 width: 0,
                 height: 10,
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
      ),
    );
  }
}

// Aqui empieza la tabla de datos 
class DataTableRegistro extends StatelessWidget {
  const DataTableRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nombre',
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
            DataCell(Text('Maria')),
            DataCell(Text('x')),
            DataCell(Text('')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jesus')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jose')),
            DataCell(Text('')),
            DataCell(Text('')),
            DataCell(Text('x')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Judas')),
            DataCell(Text('')),
            DataCell(Text('x')),
            DataCell(Text('')),
            
          ],
        ),

      ],
    );
  }
}

class BotonPersonalizado2 extends StatelessWidget {
  const BotonPersonalizado2({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {   
          },

          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Guardar y salir',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow,
                )),
          ),
        ),
      ),
    );
  }
}


  
