import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widgets_app/model/apirespuesta.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/modulo_asistencia/modulo_asistencia_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/registro_asistencia/registro_asistencia_screen.dart';
import 'package:widgets_app/util/AulasModelos.dart';
import 'package:http/http.dart' as http;

import '../../../util/ListaAsistencia.dart';
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

class RegistroAsistencias extends StatefulWidget {
  static const String name = 'Registro-Asistencias';
  Aulas categoria =  Aulas();

  ListaAsistencia listAsis =  ListaAsistencia();
  RegistroAsistencias(this.categoria, {super.key});
  @override
  State<RegistroAsistencias> createState() => _RegistroAsistenciasState();
}

class _RegistroAsistenciasState extends State<RegistroAsistencias> {

  List<dynamic> AulasList = [];
    
  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getRegistroAsistencia('registroaula/${widget.categoria.id}');
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
    final i =widget.categoria.id;
    //print(i);
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegistroAsistencias(listAsis)),
                            );
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegistroAsistenciaScreen(),
                settings: RouteSettings(
                    arguments: id,
                  ),
                
                 // Eliminamos las comillas alrededor de id
              ),
            );
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




