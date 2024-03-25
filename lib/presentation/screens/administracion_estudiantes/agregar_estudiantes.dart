import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_estudiantes/administrador_estudiantes_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:http/http.dart' as http;
//import 'package:widgets_app/util/AulasModelos.dart';

import '../../../api/ConsumoApi.dart';
import '../../../model/apirespuesta.dart';
import '../../../util/DropAulasModelo.dart';

/* Funcion para traer las aulas */

/* Future<ApiRespuesta> getAulas(apiUrl) async {
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
} */

Future<ApiRespuesta> getAulas(apiUrl) async {
  ApiRespuesta apiRespuesta = ApiRespuesta();
  final String _url = 'http://192.168.1.7:8000/api/';
  var fullUrl = _url + apiUrl;
  final response = await http.get(Uri.parse(fullUrl));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    apiRespuesta.data = jsonDecode(response.body)['aulas']
        .map((p) => DropdownItemsModel.fromJson(p))
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
int aula1 = 3;
int aula2 = 4;
int aula3 = 6;

enum NumeroAulas {aula1, aula2, aula3}

class AgregarEstudiantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddStudentsPage(),
    );
  }
}

class AddStudentsPage extends StatefulWidget {
  const AddStudentsPage({super.key});
  @override
  State<AddStudentsPage> createState() => _MyAddStudentsPage();
}

class _MyAddStudentsPage extends State<AddStudentsPage> {

  List<dynamic> AulasList = [];
  Future<void> mostrarAulas() async {
    ApiRespuesta res = await getAulas('aulas');
    if (res.error == null) {
      setState(() {
        AulasList = res.data as List<dynamic>;
      });
    }
  }

  late String selectAula;

  


  var selectValue;
  TextEditingController _nombreestudiante = TextEditingController();
  
  Future<void> _guardarEstudiantes() async {
    String nombrestudent = _nombreestudiante.text;

    /* print(nombrestudent);
    print(selectValue); */
    var data = {
      'nombre_es': nombrestudent,
      'id_aulas': selectValue,
    };
    var res = await CallApi().postData(data, 'estudiantes');
    
    var body = json.decode(res.body);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) {
      return new AdministracionEstudiantesScreen();
    }), (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    //mostrarAulas();
    // getDatos();
    super.initState();
    mostrarAulas();
    
  }


  

  NumeroAulas selectedAulas =
      NumeroAulas.aula1; //  Forma Parte del RadioListTile


  var newData; 
  @override
  Widget build(BuildContext context) {
    // manejar el null

    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),

            //_inputCampo1(),

            Padding(
              padding: const EdgeInsets.only(
                top: 105,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nombreestudiante,
                    decoration: InputDecoration(
                      labelText: 'Ingrese el nombre del estudiante',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          width: 1,
                          //style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20,),

                  /* ExpansionTile(
                    title: const Text('Aulas'),
                    subtitle:const Text('Seleccione una de las Aulas'),
                    children: [
                      RadioListTile(
                        title: const Text(' Aula numero 1'),
                        value: NumeroAulas.aula1,
                        groupValue: selectedAulas,
                        onChanged: (value) => setState(() {
                          selectedAulas = NumeroAulas.aula1;
                        }),
                      ),
                      RadioListTile(
                        title: const Text('Aula numero 2'),
                        value: NumeroAulas.aula2,
                        groupValue: selectedAulas,
                        onChanged: (value) => setState(() {
                          selectedAulas = NumeroAulas.aula2;
                        }),
                      ),
                      RadioListTile(
                        title: const Text('Aula numero 3'),
                        value: NumeroAulas.aula3,
                        groupValue: selectedAulas,
                        onChanged: (value) => setState(() {
                          selectedAulas = NumeroAulas.aula3;
                        }),
                      ),
                    ],
                  ), */

                 

    


       

FutureBuilder<void>(
  future: Future.value(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (snapshot.hasError) {
      return Center(
        child: Text("Error: ${snapshot.error}"),
      );
    } else {
      return DropdownButton(
        value: selectValue,
        dropdownColor: Colors.blue[100],
        isExpanded: true,
        hint: const Text("Selecciona un aula"),
        items: AulasList.map((e) {
          return DropdownMenuItem(
            value: e.id.toString(),
            child: Text(e.nombre_al.toString()),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectValue = value;
          });
        },
      );
    }
  },
)
                


                ],
              ),
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _guardarEstudiantes,
              child: const Text(' Guardar '),
            ),

            const SizedBox(
              height: 205,
            ),

            const _BotonVolver(),

            const SizedBox(height: 10),

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

Container inputCampo() {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 175, 175, 175),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)),
    padding: const EdgeInsets.symmetric(horizontal: 30),
    margin: const EdgeInsets.symmetric(horizontal: 30),
    child: TextFormField(
      //controller: ,
      enableInteractiveSelection: false,
      obscureText: false,
      style: const TextStyle(fontSize: 15),
      decoration:
          const InputDecoration(hintText: "Campo 1", border: InputBorder.none),
    ),
  );
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
              MaterialPageRoute(
                  builder: (context) => AdministracioAulasScreen()),
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
