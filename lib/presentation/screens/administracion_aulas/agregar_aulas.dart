import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';

import '../../../api/ConsumoApi.dart';

void main() {
  runApp(AgregarAulas());
}

class AgregarAulas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddCoursesPage(),
    );
  }
}

class AddCoursesPage extends StatefulWidget {
  @override
  _MyAddCoursesPage createState() => _MyAddCoursesPage();
}

class _MyAddCoursesPage extends State<AddCoursesPage> {
  TextEditingController _nombreaula = TextEditingController();


  Future<void>  _guardarAulas() async {
    String nombrecourse = _nombreaula.text;
  
    var data ={
      'nombre_al' : nombrecourse,
    };
    var res = await CallApi().postData(data, 'aulas');
    var body = json.decode(res.body);
    Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) {
              return new AdministracioAulasScreen();
            }), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
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

            const SizedBox(height: 100,),

            //_inputCampo1(),

            Padding(
              padding: const EdgeInsets.only(
                top: 200,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                controller: _nombreaula,
                decoration: InputDecoration(
                  
                  labelText: 'Ingrese el nombre del aula',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 1, 
                     //style: BorderStyle.none,
                    ),
                  ),
                  
                ),
              ),
              
                ],
              ),
            ),

            
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _guardarAulas,
              child: const Text(' Guardar '),
            ),

            const SizedBox(height: 205,),

            
            
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
      decoration:  BoxDecoration(
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
        decoration: const InputDecoration(
            hintText: "Campo 1",
            
            border: InputBorder.none),
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
              MaterialPageRoute(builder: (context) => AdministracioAulasScreen()),
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
