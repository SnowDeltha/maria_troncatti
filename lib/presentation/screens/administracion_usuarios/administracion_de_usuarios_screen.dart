import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
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

  EliminarUsuario(String id) async {
    deleteUsuario(id);
  }

  Future<void> deleteUsuario(String id) async {
    String _url = 'http://192.168.1.7:8000/api/userdelete/';
    var fullUrl = _url + id;

    final response = await http.delete(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      print('Eliminado');

      setState(() {});

      _reloadPage();
    } else {
      throw Exception('Fallo al eliminar el registro');
    }
  }

// Función para recargar la página
  Future<void> _reloadPage() async {
    // Esperar un breve período de tiempo para simular la carga
    await Future.delayed(Duration(seconds: 1));

    // Actualizar el estado para indicar que la carga ha terminado
    setState(() {});
    await mostrarUsuarios();
  }

  @override
  void initState() {
    super.initState();
    mostrarUsuarios();
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
            )),
          ],
        ),
        body: SingleChildScrollView(
          //padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),

              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Administración de',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Usuarios',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.orange,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    _ButtonAdd(),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: const Color(0xff83C77E),
                      width: 180,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        '        Nombre',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //const Expanded(child: SizedBox()),
                    const SizedBox(
                      width: 10,
                    ),

                    Container(
                      color: const Color(0xff83C77E),
                      width: 150,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        '       Acción',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.only(left: 5),
                height: 305,
                width: 400,
                child: ListView.builder(
                  itemCount: UsuariosList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Users categoria = UsuariosList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              color: Color(0xffDDDDDD),
                              width: 180,
                              height: 50,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              child: Text(
                                '    ${categoria.nombre} ${categoria.apellido}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
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
                                height: 50,
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    if (await confirm(
                                      context,
                                      title: const Text('Confirmar'),
                                      content: const Text(
                                          'Quieres eliminar el aula?'),
                                      textOK: const Text('Si'),
                                      textCancel: const Text('No'),
                                    )) {
                                      return EliminarUsuario('${categoria.id}');
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

              const SizedBox(height: 70),

              //const Expanded(child: SizedBox()),

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
