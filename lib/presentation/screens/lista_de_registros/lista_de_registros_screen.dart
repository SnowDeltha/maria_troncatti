import 'dart:convert';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/model/apirespuesta.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/inicio_sesion/inicio_sesion_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_asistencia/modulo_asistencia_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/registro_asistencia/registro_asistencia_screen.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:widgets_app/util/RegistroModelo.dart';
import '../../../api/ConsumoApi.dart';

import '../../../util/ListaAsistencia.dart';
import '../../../util/ReporteModelo.dart';
import 'package:intl/intl.dart';

Future<ApiRespuesta> getRegistroAsistencia(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  String _url = 'http://192.168.1.7:8000/api/';
  var fullUrl = _url + apiUrl;
  final response = await http.get(Uri.parse(fullUrl));
  if (response.statusCode == 200) {
    apiRespuesta.data = jsonDecode(response.body)['registro']
        .map((p) => ListaAsistencia.fromJson(p))
        .toList();
    apiRespuesta.data as List<dynamic>;

    //return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Fallo al traer la informacion');
  }
  return apiRespuesta;
}

Future<void> generateExcelReport(dynamic valor) async {
  // Obtener datos de la API
  String fecha = valor.fecha_registro;
  int idaula = valor.id_aula;
  ApiRespuesta apiRespuesta = ApiRespuesta();
  final response = await http.get(Uri.parse(
      'http://192.168.1.7:8000/api/registroReporte/${fecha}/${idaula}'));
  apiRespuesta.data = jsonDecode(response.body)['registro']
      .map((p) => ReporteModelo.fromJson(p))
      .toList();
  apiRespuesta.data as List<dynamic>;

  //Crear el objeto Excel
  final excel = Excel.createExcel();
  final Sheet sheet = excel['Sheet1'];

  sheet.appendRow([
    TextCellValue("Fecha de registro"),
    TextCellValue("Asistencia"),
    TextCellValue("Nombre del estudiante")
  ]);

  // Añadir datos
  if (apiRespuesta.data != null) {
    for (var item in apiRespuesta.data as Iterable) {
      String asistenciaReg = "";

      if (item.asistencia_ad == 1) {
        asistenciaReg = "Asistencia";
      } else if (item.asistencia_ad == 2) {
        asistenciaReg = "Falta Justificada";
      } else if (item.asistencia_ad == 3) {
        asistenciaReg = "Falta Injustificada";
      }

      sheet.appendRow([
        TextCellValue(item.fecha_registro),
        TextCellValue(asistenciaReg),
        TextCellValue(item.nombre_es.toString())
      ]);
      // var cell = sheet.cell(CellIndex.indexByString('A1'));
      // var fechaR= item.fecha_registro;
      // cell.value = TextCellValue(fechaR);
    }
  }
  final Directory? downloadsDir = await getExternalStorageDirectory();
  if (downloadsDir != null) {
    final String filePath =
        '${downloadsDir.path}/reporte.xlsx'; // Ruta completa del archivo
    var bytes = excel.encode(); // Codificar el archivo Excel
    var archivo = File(filePath);
    archivo
        .writeAsBytesSync(bytes!); // Guardar el archivo en la ruta especificada

    // Abrir el archivo con la aplicación predeterminada del sistema
    OpenFile.open(filePath);
  }
}

class RegistroAsistencias extends StatefulWidget {
  static const String name = 'Registro-Asistencias';
  // Aulas categoria =  Aulas();
  int id = 0;

  ListaAsistencia listAsis = ListaAsistencia();
  RegistroAsistencias(this.id, {super.key});
  @override
  State<RegistroAsistencias> createState() => _RegistroAsistenciasState();
}

class _RegistroAsistenciasState extends State<RegistroAsistencias> {
  List<dynamic> AulasList = [];
  
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

  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getRegistroAsistencia('registroaula/${widget.id}');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }

  EliminarRegistros(String id) async {
    deleteRegistros(id);
  }

  // Variable para almacenar el estado de la página

  Future<void> deleteRegistros(String id) async {
    String url = 'http://192.168.1.7:8000/api/detalledelete/';
    var fullUrl = url + id;

    final response = await http.delete(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      setState(() {});

      _reloadPage();
    } else {
      // Si el servidor no devuelve un código de estado 200 OK,
      // lanza una excepción con un mensaje de error.
      throw Exception('Fallo al eliminar el registro');
    }
  }

// Función para recargar la página
  Future<void> _reloadPage() async {
    // Esperar un breve período de tiempo para simular la carga
    await Future.delayed(const Duration(seconds: 1));

    // Actualizar el estado para indicar que la carga ha terminado

    setState(() {});
    await mostrarAulas();
  }

  @override
  void initState() {
    super.initState();
    mostrarAulas();
  }

  Widget build(BuildContext context) {
    final i = widget.id;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                //const SizedBox(width: 70),
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
            )),
          ],
        ),
        body: SingleChildScrollView(
          //padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                'Lista de Registros',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(
                width: 0,
                height: 35,
              ),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),

                  Container(
                    color: const Color(0xff83C77E),
                    width: 180,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      '    Registro XLS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //const Expanded(child: SizedBox()),

                  const SizedBox(
                    width: 12,
                  ),

                  Container(
                    color: const Color(0xff83C77E),
                    width: 150,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      '       Acción',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                height: 400,
                width: 400,
                child: ListView.builder(
                  itemCount: AulasList.length,
                  itemBuilder: (BuildContext context, int index) {
                    ListaAsistencia categoria = AulasList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Color(0xffDDDDDD),
                              width: 180,
                              height: 60,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              child: TextButton(
                                onPressed: () {
                                  generateExcelReport(categoria);
                                },
                                child: Column(
                                  children: [
                                    Text('${categoria.fecha_registro}'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        //Expanded(child: SizedBox()),
                        //const SizedBox(width: 5,),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Column(
                            children: [
                              Container(
                                color: Color(0xffDDDDDD),
                                width: 150,
                                height: 60,
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    if (await confirm(
                                      context,
                                      title: const Text('Confirmar'),
                                      content: const Text(
                                          'Quieres eliminar el registro?'),
                                      textOK: const Text('Si'),
                                      textCancel: const Text('No'),
                                    )) {
                                      return EliminarRegistros(
                                          '${categoria.id}');
                                    }
                                    return print('pressedCancel');
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),

              //const SizedBox(height: 20),

              //Boton Volver
              _CrearNuevoRegistro(i),
              const SizedBox(
                width: 0,
                height: 10,
              ),

              //const Expanded(child: SizedBox()),

              const _BotonVolverInicio(),

              const SizedBox(
                width: 0,
                height: 10,
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
      ),
    );
  }
}

class _BotonVolverInicio extends StatelessWidget {
  const _BotonVolverInicio();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ModuloAsistenciaScreen()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('  Volver  ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.yellow,
                )),
          ),
        ),
      ),
    );
  }
}

class _CrearNuevoRegistro extends StatelessWidget {
  _CrearNuevoRegistro(this.id);
  int? id;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            _guardarAulas(context, id!);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '  Crear Nuevo Registro  ',
              style: TextStyle(
                fontSize: 22,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _guardarAulas(BuildContext context, int id) async {
  DateTime now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  var registro = Registro();
  var data = {
    'id_aula': id,
    'fecha_registro': formatter.format(now),
  };

  var res = await CallApi().postData(data, 'registro');
  var body = json.decode(res.body);

  if (res.statusCode == 200) {
    // Se recibió una respuesta exitosa del servidor
    // Verificamos si el cuerpo de la respuesta contiene el registro
    if (body.containsKey('registro')) {
      // El registro se encuentra en el cuerpo de la respuesta
      // Puedes acceder a los datos del registro como desees
      registro = Registro.fromJson(body['registro']);
      print('Registro creado: $registro');

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) {
        return RegistroAsistenciaScreen(registro);
      }), (Route<dynamic> route) => false);

      // Aquí puedes realizar cualquier acción adicional con los datos del registro
    }

    // Navegamos de regreso a la pantalla de registro de asistencia
  } else if (res.statusCode == 404) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Error'),
          content: Text(
              'No se pudo encontrar el registro en la respuesta del servidor'),
        );
      },
    );
  } else {
    print('Error en la solicitud al servidor: ${res.statusCode}');
  }
}
