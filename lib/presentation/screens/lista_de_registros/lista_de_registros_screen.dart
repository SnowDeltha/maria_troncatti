import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:widgets_app/model/apirespuesta.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
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
     String fecha= valor.fecha_registro;
     int idaula= valor.id_aula;
     ApiRespuesta apiRespuesta =ApiRespuesta();
     final response = await http.get(Uri.parse('http://192.168.1.7:8000/api/registroReporte/${fecha}/${idaula}'));
      apiRespuesta.data = jsonDecode(response.body)['registro']
        .map((p) => ReporteModelo.fromJson(p))
        .toList();
    apiRespuesta.data as List<dynamic>;

      //Crear el objeto Excel
     final excel = Excel.createExcel();
     final Sheet sheet = excel['Sheet1'];




sheet.appendRow([TextCellValue("Fecha de registro"),TextCellValue("Asistencia"),TextCellValue("Nombre del estudiante")]);

    // Añadir datos
   if (apiRespuesta.data != null) {
      for (var item in apiRespuesta.data as Iterable) {

        String asistenciaReg="";

        if(item.asistencia_ad == 1){

           asistenciaReg = "Asistencia";

        }else if(item.asistencia_ad == 2){
           asistenciaReg = "Falta Justificada";
        }
        else if(item.asistencia_ad == 3){
           asistenciaReg = "Falta Injustificada";
        }
        

        sheet.appendRow([TextCellValue(item.fecha_registro),TextCellValue(asistenciaReg),TextCellValue(item.nombre_es.toString())]);
        // var cell = sheet.cell(CellIndex.indexByString('A1'));
        // var fechaR= item.fecha_registro;
        // cell.value = TextCellValue(fechaR);
      }
    }
  final Directory? downloadsDir = await getExternalStorageDirectory();
  if (downloadsDir != null) {
  final String filePath = '${downloadsDir.path}/reporte.xlsx'; // Ruta completa del archivo
  var bytes = excel.encode(); // Codificar el archivo Excel
  var archivo = File(filePath);
  archivo.writeAsBytesSync(bytes!); // Guardar el archivo en la ruta especificada

  // Abrir el archivo con la aplicación predeterminada del sistema
  OpenFile.open(filePath);
}

  }
class RegistroAsistencias extends StatefulWidget {
  static const String name = 'Registro-Asistencias';
  // Aulas categoria =  Aulas();
  int id=0;

  ListaAsistencia listAsis =  ListaAsistencia();
  RegistroAsistencias(this.id, {super.key});
  @override
  State<RegistroAsistencias> createState() => _RegistroAsistenciasState();
}




class _RegistroAsistenciasState extends State<RegistroAsistencias> {

  List<dynamic> AulasList = [];
    
  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getRegistroAsistencia('registroaula/${widget.id}');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    mostrarAulas();
  }
  Widget build(BuildContext context) {
    final i =widget.id;
     return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.yellow,
        actions: <Widget>[

          Expanded(
            child: Row(
            children: <Widget>[

              const SizedBox(width:  15),

              Image.asset('assets/images/Escuela.png'),

              const SizedBox(width:  70),

              const Text("Nombre del Usuario"),

              PopupMenuButton(
                icon: const CircleAvatar(backgroundImage: AssetImage('assets/images/buho2.png')),
                itemBuilder: (BuildContext context) {
                  return [
                     PopupMenuItem(
                      child: Text('Perfil'),
                      value: 'Perfil',
                      onTap: () {

                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PerfilScreen()),
                        ); 
                        
                      },
                      ),
                       PopupMenuItem(
                        child:  Text('Acerca de'),
                        value: 'Acerca de',
                        onTap: () {
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AcercaScreen()),
                        ); 
                        },
                        ),

                         PopupMenuItem(
                          child: Text('Cerrar Sesión'),
                          value: 'Cerrar Sesión',
                          onTap: () {
                            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const InicioScreen()),
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
            )),

        ],
      ),

      body: Column(
        children: [

          const SizedBox(height: 50,),

            const Text(
                    'Lista de Registros ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.orange,
                    
                    ),
                  ),


                const SizedBox(width: 0,height: 100,),


              Container(
              height: 300,
              width: 200,
              child: ListView.builder(
                itemCount: (AulasList.length / 2)
                    .ceil(), // Asegura que se muestren todos los elementos
                itemBuilder: (BuildContext context, int index) {
                  int startIndex = index * 2;
                  int endIndex = startIndex + 2;
                  if (endIndex > AulasList.length) {
                    endIndex = AulasList.length;
                  }
                  List sublist = AulasList.sublist(startIndex, endIndex);
                  return Row(
                    children: sublist.map((listAsis) {
                      return Expanded(
                        child: IconButton(
                          onPressed: () {
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegistroAsistencias(listAsis)),
                            ); */
                            generateExcelReport(listAsis);
                          },
                          icon: Column(
                            children: [
                              Text('${listAsis.fecha_registro}'),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),

           


                //Boton Volver
                _CrearNuevoRegistro(i),
                const SizedBox(width: 0,height: 10,),

                
                const Expanded(child: SizedBox()),

                const _BotonVolverInicio(),

                const SizedBox(width: 0,height: 10,),


                  

          
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


class _BotonVolverInicio extends StatelessWidget {
  const _BotonVolverInicio ();
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
                  MaterialPageRoute(builder: (context) => const ModuloAsistenciaScreen()),
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
            _guardarAulas(context,id!);
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
  var registro=Registro();
  var data ={
    'id_aula' : id,
    'fecha_registro': now.toString(),
    
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
      
      // Aquí puedes realizar cualquier acción adicional con los datos del registro
    } else {
      // El cuerpo de la respuesta no contiene el registro
      print('No se pudo encontrar el registro en la respuesta del servidor');
    }
    
    // Navegamos de regreso a la pantalla de registro de asistencia
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) {
        return RegistroAsistenciaScreen(registro);
      }), 
      (Route<dynamic> route) => false
    );
  } else {
    // La solicitud al servidor no fue exitosa
    // Puedes manejar el error de acuerdo a tus necesidades
    print('Error en la solicitud al servidor: ${res.statusCode}');
  }
}



