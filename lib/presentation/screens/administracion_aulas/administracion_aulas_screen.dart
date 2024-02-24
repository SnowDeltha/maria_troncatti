import 'package:flutter/material.dart';
import '../../../api/ConsumoApi.dart';
import '../../../model/apirespuesta.dart';
import '../../../util/AulasModelos.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AdministracioAulasScreen extends StatefulWidget {
  static const String name = 'administracion_aulas_screen';
  @override
  // ignore: library_private_types_in_public_api
  _AdministracioAulasScreenState createState() => _AdministracioAulasScreenState();
}

class _AdministracioAulasScreenState extends State<AdministracioAulasScreen> {
  // ignore: non_constant_identifier_names

  List<dynamic> AulasList = [];
  Future<void> mostrarCategoria() async {
    ApiRespuesta res = await CallApi().getAulas('aulas');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }

 @override
  void initState() {
    mostrarCategoria();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion Usuarios'),
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


class DataTableRegistro extends StatelessWidget {
  const DataTableRegistro({super.key});

  @override
  Widget build(BuildContext context){
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
    
