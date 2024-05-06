import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/model/apirespuesta.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/inicio_sesion/inicio_sesion_screen.dart';
import 'package:widgets_app/presentation/screens/lista_de_registros/lista_de_registros_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';

import 'package:http/http.dart' as http;
import 'package:widgets_app/util/AulasModelos.dart';

Future<ApiRespuesta> getAulas(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  final String _url = 'http://192.168.1.7:8000/api/';
  var fullUrl = _url + apiUrl;
  final response = await http.get(Uri.parse(fullUrl));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    apiRespuesta.data = jsonDecode(response.body)['aulas']
        .map((p) => Aulas.fromJson(p))
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

class ModuloAsistenciaScreen extends StatefulWidget {
  static const String name = 'modulo_asistencia_screen';
  const ModuloAsistenciaScreen({super.key});

  @override
  State<ModuloAsistenciaScreen> createState() => _ModuloAsistenciaScreenState();
}

class _ModuloAsistenciaScreenState extends State<ModuloAsistenciaScreen> {
  List<dynamic> AulasList = [];
  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getAulas('aulas');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
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
  void initState() {
    //mostrarAulas();
    // getDatos();
    super.initState();
    mostrarAulas();
  }

  Widget build(BuildContext context) {
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
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Modulo de Asistencia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(
                height: 35,
              ),

              Container(
                padding: const EdgeInsets.only(left: 5),
                height: 500,
                width: 400,
                child: ListView.builder(
                  itemCount: AulasList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Aulas categoria = AulasList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Color(0xffDDDDDD),
                              width: 230,
                              height: 60,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistroAsistencias(categoria.id!)),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text('${categoria.nombre_al}'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Expanded(child: SizedBox()),
                        //const SizedBox(width: 5,),
                      ],
                    );
                  },
                ),
              ),
              //const Expanded(child: SizedBox()),
              const SizedBox(
                width: 0,
                height: 10,
              ),
              const _BotonVolverInicio(),
              const SizedBox(
                width: 0,
                height: 10,
              ),

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
              MaterialPageRoute(builder: (context) => const InicioScreen()),
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

// class _ListaDeRegistros extends StatelessWidget {
//   const _ListaDeRegistros();
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(50),
//       child: Material(
//         color: Colors.green,
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>  RegistroAsistencias(categoria)),
//             );
//           },
//           child: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Text('Lista de Registros',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: Colors.yellow,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
