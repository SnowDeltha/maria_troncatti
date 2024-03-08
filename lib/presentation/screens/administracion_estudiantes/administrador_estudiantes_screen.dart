import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_estudiantes/agregar_estudiantes.dart';
import 'package:widgets_app/util/estudiantesModelo.dart';
import '../../../model/apirespuesta.dart';
import 'package:http/http.dart' as http;

Future<ApiRespuesta> getEstudiantes(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  final String _url = 'http://192.168.1.7:8000/api/';
  var fullUrl = _url + apiUrl;
  final response = await http.get(Uri.parse(fullUrl));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    apiRespuesta.data = jsonDecode(response.body)['estudiantes']
        .map((p) => Estudiantes.fromJson(p))
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



class AdministracionEstudiantesScreen extends StatefulWidget {
  static const String name = 'administracion_estudiantes_screen';
  const AdministracionEstudiantesScreen({super.key});

  @override
  State<AdministracionEstudiantesScreen> createState() =>
      _AdministracionEstudiantesScreenState();
}

class _AdministracionEstudiantesScreenState
    extends State<AdministracionEstudiantesScreen> {
  late Future<Estudiantes> futureUser;
  List<dynamic> EstudiantesList = [];
  Future<void> mostrarEstudiantes() async {
    ApiRespuesta res = await getEstudiantes('estudiantes');
    if (res.error == null) {
      setState(() {
        EstudiantesList = res.data as List<dynamic>;
      });
    }
  }

  @override

  void initState() {
    super.initState();
    mostrarEstudiantes();
    
  }

  

  Widget build(BuildContext context) {
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
                const SizedBox(width: 15),
                Image.asset('assets/images/Escuela.png'),
                const SizedBox(width: 70),
                const Text("Nombre del Usuario"),
                PopupMenuButton(
                  icon: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/buho2.png')),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: const Text('Perfil'),
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
                      PopupMenuItem(
                        child: const Text('Cerrar Sesión'),
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
            )),
          ],
        ),

        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 35,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Administración de Estudiantes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  _ButtonAdd(),
                ],
              ),
            ),

            Container(
              height: 350,
              width: 200,
              child: 
              ListView.builder(
                itemCount: EstudiantesList.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  Estudiantes categoria = EstudiantesList[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      child:  SizedBox(
                        width: 100,
                        height: 80,
                        child: Stack(
                          children:[
                            Text('${categoria.nombre_es}'),
  
                ],
              )
            )
          ),
        );  
      }
    ),
            ),

            

            //const SizedBox(height: 5),

            const Expanded(child: SizedBox()),

            //const Expanded(child: SizedBox()),
            const _BotonVolver(),  

            const SizedBox(height: 10,),

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

//Implementacion del Builder para crear cada uno de los elementos




class _BotonVolver extends StatelessWidget {
  const _BotonVolver({super.key});
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
                  builder: (context) => const ModuloConfiguracion()),
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

class _ButtonAdd extends StatelessWidget {
  const _ButtonAdd({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.orange,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AgregarEstudiantes()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Text(' Agregar ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}



