import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/lista_de_registros/lista_de_registros_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/util/DetalleAsistencia.dart';
import 'package:widgets_app/util/RegistroModelo.dart';
import '../../../model/apirespuesta.dart';
import '../../../util/estudiantesModelo.dart';
import 'package:http/http.dart' as http;

import '../inicio_sesion/inicio_sesion_screen.dart';

Future<ApiRespuesta> getAulasEstudiantes(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  String url = 'http://192.168.1.7:8000/api/';
  var fullUrl = url + apiUrl;
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
  final Registro registro;
  const RegistroAsistenciaScreen(this.registro, {Key? key}) : super(key: key);

  @override
  State<RegistroAsistenciaScreen> createState() =>
      _RegistroAsistenciaScreenState();
}

class _RegistroAsistenciaScreenState extends State<RegistroAsistenciaScreen> {
  DateTime selectedDate = DateTime.now();
  List<dynamic> AulasList = [];
  final List<DetalleAsistencia> detallesAsistencia = [];

  int? selectedOption;

  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getAulasEstudiantes(
        'estudiantescursos/${widget.registro.id_aula}');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }

  @override
  void initState() {
    mostrarAulas();
    super.initState();
  }

  void _borrarCache(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.remove('user');
    await localStorage.remove('token');
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InicioSesionScreen()),
    );
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
                  const Text("Administrador"),
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
                          child: const Text('Acerca de'),
                          value: 'Acerca de',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AcercaScreen()),
                            );
                          },
                        ),
                        /* PopupMenuItem(
                          child: Text('Cerrar Sesión'),
                          value: 'Cerrar Sesión',
                          

                          onTap: () {
                          _borrarCache(context);
                        },
                        ), */
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
                horizontal: 10,
              ),
              child: Text(
                "Quito, ${selectedDate.day} de ${selectedDate.month} - ${selectedDate.year}",
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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    DataTableRegistro(
                        AulasList: AulasList,
                        detallesAsistencia: detallesAsistencia,
                        idRegistro: widget.registro.id!),
                  ],
                ),
            ),
            const SizedBox(width: 0, height: 10),
            BotonPersonalizado2(
              detallesAsistencia: detallesAsistencia,
              id: widget.registro.id_aula!,
            ),
            // const Expanded(child: SizedBox()),
            // Pie de página
            const SizedBox(width: 0, height: 10),
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
  final List<DetalleAsistencia> detallesAsistencia;
  final int idRegistro;

  DataTableRegistro(
      {Key? key,
      required this.AulasList,
      required this.detallesAsistencia,
      required this.idRegistro})
      : super(key: key);

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
        selectedOptions[estudiante.id] ??= null;
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
                    actualizarEstado(estudiante.id, widget.idRegistro, value!);
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
                    actualizarEstado(estudiante.id, widget.idRegistro, value!);
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
                    actualizarEstado(estudiante.id, widget.idRegistro, value!);
                  });
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  void actualizarEstado(int estudianteId, int personaId, int nuevoValor) {
    setState(() {
      var index = widget.detallesAsistencia
          .indexWhere((detalle) => detalle.id_est == estudianteId);
      if (index != -1) {
        widget.detallesAsistencia[index].asistencia_ad = nuevoValor;
      } else {
        widget.detallesAsistencia.add(DetalleAsistencia(
          id_est: estudianteId,
          asistencia_ad: nuevoValor,
          id_registro_persona: personaId,
        ));
      }
      // Actualizar el valor en el mapa de opciones seleccionadas
      selectedOptions[estudianteId] = nuevoValor;
    });
  }
}

class BotonPersonalizado2 extends StatelessWidget {
  final List<DetalleAsistencia>? detallesAsistencia;
  final int? id;

  const BotonPersonalizado2({Key? key, this.detallesAsistencia, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () async {
            if (detallesAsistencia != 0) {
              await _guardarDatosAsistencia(context, detallesAsistencia!, id!);
            } else {
              print('La lista de detalles de asistencia está vacía.');
            }
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

Future<void> _guardarDatosAsistencia(BuildContext context,
    List<DetalleAsistencia> detallesAsistencia, int id) async {
  try {
    final datos = {'detallesAsistencia': detallesAsistencia};
    final url =
        'http://192.168.1.7:8000/api/registroasistencia'; // Reemplaza esto con la URL de tu servidor
    final respuesta = await http.post(Uri.parse(url), body: jsonEncode(datos));
    if (respuesta.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegistroAsistencias(id)),
      );
      // Éxito al guardar los datos
      print('Datos de asistencia guardados correctamente.');
    } else {
      // Error al guardar los datos
      print(
          'Error al guardar los datos de asistencia. Código de estado: ${respuesta.statusCode}');
    }
  } catch (error) {
    // Error de red u otro error
    print('Error al procesar la solicitud: $error');
  }
}
