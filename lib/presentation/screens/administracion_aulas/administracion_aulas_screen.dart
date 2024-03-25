import 'dart:convert';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/agregar_aulas.dart';
//import '../../../api/ConsumoApi.dart';
import '../../../model/apirespuesta.dart';
import '../../../util/AulasModelos.dart';
import 'package:http/http.dart' as http;

Future<ApiRespuesta> getAulas(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
   const String _url = 'http://192.168.1.7:8000/api/';
   var fullUrl = _url + apiUrl;
   final response = await http
       .get(Uri.parse(fullUrl));
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

class AdministracioAulasScreen extends StatefulWidget {
  static const String name = 'administracion_aulas_screen';
  @override
  // ignore: library_private_types_in_public_api
  _AdministracioAulasScreenState createState() =>
      _AdministracioAulasScreenState();
}

class _AdministracioAulasScreenState extends State<AdministracioAulasScreen> {
  // ignore: non_constant_identifier_names

  /* List<dynamic> AulasList = [];
  Future<void> mostrarCategoria() async {
    ApiRespuesta res = await getAulas('aulas');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  } */

  late Future<Aulas> futureAulas;
  List<dynamic> AulasList = [];
   Future<void> mostrarAulas() async {
    ApiRespuesta res =await getAulas('aulas');
   if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }
  EliminarAulas(String id) async {
  deleteAulas(id);
}

// Variable para almacenar el estado de la página
  bool _isLoading = false;

 Future<void> deleteAulas(String id) async {
  String _url = 'http://192.168.1.7:8000/api/aulasdelete/';
  var fullUrl = _url + id;

  final response = await http.delete(Uri.parse(fullUrl));

  if (response.statusCode == 200) {
    print('Eliminar');

     setState(() {
        _isLoading = true;
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
    await Future.delayed(Duration(seconds: 1));

    // Actualizar el estado para indicar que la carga ha terminado
    setState(() {
      _isLoading = false;
    });
    await mostrarAulas();
  }


  @override
  void initState() {
    mostrarAulas();
    super.initState();
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
                const Expanded(child: SizedBox()),

                //const SizedBox(width:  70),

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

        /* 

        body: ListView.builder(
          itemCount: UsuariosList.length,
         itemBuilder: (BuildContext context, int index){
          Users categoria = UsuariosList[index];
            return Text(
              '${categoria.nombre}'
              '${categoria.id}'
              
            );
          },
        ),
        */

        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),

            const Text(
              'Administración de Aulas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.orange,
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
              height: 100,
              width: 400,
              child: Row(
                children: [
                  Column(
                  
                         children: [
                              Container(
                                color: Color(0xff83C77E),
                                width: 180,
                                height: 50,
                                padding: EdgeInsets.all(10),
                               child: Text('Nombre'),
                              )
                          ],
                      ),
                   Column(
                         children: [
                              Container(
                                color: Color(0xff83C77E),
                                width: 180,
                                height: 50,
                                padding: EdgeInsets.all(10),
                               child: Text('Acciones'),
                              )
                          ],
                      ),
                ],

              ),
              
            ),

            

            Container(
              height: 350,
              width: 400,
              child: ListView.builder(
                itemCount: AulasList.length,
                itemBuilder: (BuildContext context, int index){
                  Aulas categoria = AulasList[index];
                  return Row(
                    children: [
                      
                      Column(
                         children: [
                              Container(
                                color: Color(0xffDDDDDD),
                                width: 250,
                                height: 50,
                                padding: EdgeInsets.all(10),
                               child: Text('${categoria.nombre_al}'),
                              )
                          ],
                      ),
                     
                      Column(
                         children: [
                              IconButton(
                              iconSize: 20,
                              icon: const Icon(Icons.delete),
                              onPressed: 


                              () async {
            if (await confirm(
              context,
              title: const Text('Confirmar'),
              content: const Text('Quieres eliminar el aula?'),
              textOK: const Text('Si'),
              textCancel: const Text('No'),
            )) {
              return EliminarAulas('${categoria.id}');
            }
            return print('pressedCancel');
          },
                            ),
                          ],
                      )
                    ],
                  );
                },
              ),
            ),

            

            //Boton Volver
            
            const Expanded(child: SizedBox()),

            const _BotonVolver(),

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
    );
  }
}

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
              MaterialPageRoute(builder: (context) => ModuloConfiguracion()),
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
              MaterialPageRoute(builder: (context) => AgregarAulas()),
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
