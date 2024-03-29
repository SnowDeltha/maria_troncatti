import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_usuarios/agregar_usuarios.dart';
import 'package:widgets_app/util/usersModelos.dart';
import '../../../model/apirespuesta.dart';
import 'package:http/http.dart' as http;

Future<ApiRespuesta> getUsuarios(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  final String _url = 'http://192.168.1.7:8000/api/';
  var fullUrl = _url + apiUrl;
  final response = await http.get(Uri.parse(fullUrl));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    apiRespuesta.data = jsonDecode(response.body)['usuarios']
        .map((p) => Users.fromJson(p))
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

class AdministracionUsuariosScreen extends StatefulWidget {
  static const String name = 'administracion_usuarios_screen';
  const AdministracionUsuariosScreen({super.key});

  @override
  State<AdministracionUsuariosScreen> createState() =>
      _AdministracionUsuariosScreenState();
}

class _AdministracionUsuariosScreenState
    extends State<AdministracionUsuariosScreen> {
  late Future<Users> futureUser;
  List<dynamic> UsuariosList = [];
  Future<void> mostrarUsuarios() async {
    ApiRespuesta res = await getUsuarios('users');
    if (res.error == null) {
      setState(() {
        UsuariosList = res.data as List<dynamic>;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    mostrarUsuarios();
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
                'Administración de Usuarios',
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

            const SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 400,
              width: 350,
              child: ListView.builder(
                  itemCount: UsuariosList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Users categoria = UsuariosList[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: GestureDetector(
                          child: SizedBox(
                              width: 0,
                              height: 50,
                              child: Stack(
                                children: [
                                  Text('${categoria.nombre} ${categoria.apellido}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),),
                                  
                                ],
                              ))),
                    );
                  }),
            ),

            //const SizedBox(height: 5),

            const Expanded(child: SizedBox()),

            //const Expanded(child: SizedBox()),
            const _BotonVolver(),

            const SizedBox(
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
              MaterialPageRoute(builder: (context) => AgregarUsers()),
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
