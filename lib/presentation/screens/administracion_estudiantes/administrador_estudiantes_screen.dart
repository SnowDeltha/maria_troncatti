import 'dart:async';
import 'dart:convert';
import 'package:confirm_dialog/confirm_dialog.dart';
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
  const String url = 'http://192.168.1.7:8000/api/';
  var fullUrl = url + apiUrl;
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
  List<dynamic> EstudiantesList = [];
  Future<void> mostrarEstudiantes() async {
    ApiRespuesta res = await getEstudiantes('estudiantes');
    if (res.error == null) {
      setState(() {
        EstudiantesList = res.data as List<dynamic>;
      });
    }
  }

  EliminarEstudiantes(String id) async {
    deleteEstudiante(id);
  }



  // Variable para almacenar el estado de la página

 Future<void> deleteEstudiante(String id) async {
  String url = 'http://192.168.1.7:8000/api/estudiantesdelete/';
  var fullUrl = url + id;

  final response = await http.delete(Uri.parse(fullUrl));

  if (response.statusCode == 200) {
     setState(() {
      });

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
    setState(() {
    });
    await mostrarEstudiantes();
  }

  @override

  void initState() {
    super.initState();
    mostrarEstudiantes();
    
  }

  
@override
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


            const SizedBox(height: 18),

            Row(children: [

              const SizedBox(width: 10),

              Container(
                        color: const Color(0xff83C77E),
                        width: 180,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        child: const Text('       Nombre',
                        style: TextStyle(

                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          
                        ),
                        ),
                      ),

                      const Expanded(child: SizedBox()),

                      Container(
                        color: const Color(0xff83C77E),
                        width: 180,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        child: const Text('       Acción',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      const SizedBox(width: 10),  
            ],),



            Container(
              padding: const EdgeInsets.only(left: 5),
              height: 350,
              width: 400,
              child: ListView.builder(
                itemCount: EstudiantesList.length,
                itemBuilder: (BuildContext context, int index) {
                  Estudiantes categoria = EstudiantesList[index];
                  return Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            color: Color(0xffDDDDDD),
                            width: 180,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            child: Text('    ${categoria.nombre_es}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),),
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
                              width: 180,
                              height: 50,
                        
                              child: IconButton(
                              
                              iconSize: 20,
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                if (await confirm(
                                  context,
                                  title: const Text('Confirmar'),
                                  content:
                                      const Text('Quieres eliminar el estudiante?'),
                                  textOK: const Text('Si'),
                                  textCancel: const Text('No'),
                                )) {
                                  return EliminarEstudiantes('${categoria.id}');
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



