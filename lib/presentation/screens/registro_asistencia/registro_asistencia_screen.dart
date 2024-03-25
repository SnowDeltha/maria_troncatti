import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import '../../../model/apirespuesta.dart';
import '../../../api/ConsumoApi.dart';
import '../../../util/estudiantesModelo.dart';
import 'package:http/http.dart' as http;

Future<ApiRespuesta> getAulasEstudiantes(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  String _url = 'http://192.168.1.7:8000/api/';
  var fullUrl = _url + apiUrl;
  final response = await http.get(Uri.parse(fullUrl));
  if (response.statusCode == 200) {
    apiRespuesta.data = jsonDecode(response.body)['estudiantes']
        .map((p) => Estudiantes.fromJson(p))
        .toList();
    apiRespuesta.data as List<dynamic>;
  } else {
    throw Exception('Fallo al traer la información');
  }
  return apiRespuesta;
}

class RegistroAsistenciaScreen extends StatefulWidget {
  static const String name = 'registro_asistencia_screen';
  const RegistroAsistenciaScreen({Key? key}) : super(key: key);

  @override
  State<RegistroAsistenciaScreen> createState() =>
      _RegistroAsistenciaScreenState();
}

class _RegistroAsistenciaScreenState extends State<RegistroAsistenciaScreen> {
  DateTime selectedDate = DateTime.now();
  List<dynamic> AulasList = [];

  int? selectedOption;

  @override
  void initState() {
    mostrarAulas();
    super.initState();
  }

  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getAulasEstudiantes('estudiantescursos/16');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Colors.yellow,
          actions: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 15),
                  Image.asset('assets/images/Escuela.png'),
                  const Expanded(child: SizedBox()),
                  const Text("Nombre del Usuario"),
                  PopupMenuButton(
                    icon: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/buho2.png')),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text('Perfil'),
                          value: 'Perfil',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PerfilScreen()),
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Acerca de'),
                          value: 'Acerca de',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AcercaScreen()),
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Cerrar Sesión'),
                          value: 'Cerrar Sesión',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InicioScreen()),
                            );
                          },
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 'Perfil') {
                        //Realiza la accion de boton
                      } else if (value == 'Acerca de') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AcercaScreen(),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
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
            const SizedBox(width: 0, height: 10),
            Expanded(
              child: Center(
                child: GridView.count(
                  shrinkWrap: false,
                  crossAxisCount: 1,
                  children: [
                    DataTableRegistro(AulasList: AulasList),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 0, height: 10),
            const BotonPersonalizado2(),
            const Expanded(child: SizedBox()),
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

class DataTableRegistro extends StatefulWidget {
  final List<dynamic> AulasList;

  const DataTableRegistro({Key? key, required this.AulasList}) : super(key: key);

  @override
  _DataTableRegistroState createState() => _DataTableRegistroState();
}

class _DataTableRegistroState extends State<DataTableRegistro> {
  Map<int, int?> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Estudiante',
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
      rows: widget.AulasList.map((estudiante) {
        selectedOptions[estudiante.id] ??= null; // Inicializa la selección del estudiante
        return DataRow(
          cells: [
            DataCell(Text(estudiante.nombre_es ?? '')),
            DataCell(
              Radio<int>(
                value: 1,
                groupValue: selectedOptions[estudiante.id],
                onChanged: (value) {
                  setState(() {
                    selectedOptions[estudiante.id] = value;
                    actualizarEstado(estudiante.id);
                  });
                },
              ),
            ),
            DataCell(
              Radio<int>(
                value: 2,
                groupValue: selectedOptions[estudiante.id],
                onChanged: (value) {
                  setState(() {
                    selectedOptions[estudiante.id] = value;
                    actualizarEstado(estudiante.id);
                  });
                },
              ),
            ),
            DataCell(
              Radio<int>(
                value: 3,
                groupValue: selectedOptions[estudiante.id],
                onChanged: (value) {
                  setState(() {
                    selectedOptions[estudiante.id] = value;
                    actualizarEstado(estudiante.id);
                  });
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}


void actualizarEstado(int nuevoValor) {
  // Aquí puedes actualizar el estado de tu aplicación según sea necesario
  print('Nuevo valor seleccionado: $nuevoValor');
}

class BotonPersonalizado2 extends StatelessWidget {
  const BotonPersonalizado2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Guardar y salir',
              style: TextStyle(
                fontSize: 25,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const RegistroAsistenciaScreen());
}
