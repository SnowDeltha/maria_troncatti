import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
import '../../../api/ConsumoApi.dart';
import 'package:widgets_app/presentation/screens/pantalla_inicio/Inicio_screen.dart';

//import 'package:http/http.dart';

class InicioSesionScreen extends StatefulWidget {
  static const name = 'inicio_sesion_screen';

  const InicioSesionScreen({super.key});

  @override
  State<InicioSesionScreen> createState() => _InicioSesionScreenState();
}

class _InicioSesionScreenState extends State<InicioSesionScreen> {
  //final apiurl = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      //   backgroundColor: Colors.yellow,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: Image.asset('assets/images/Escuela.png'),
          ),

          const Text(
            'Gestor de Asistencia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.orange,
            ),
          ),

          const SizedBox(
            width: 0,
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              controller: _emailController,
              enableInteractiveSelection: false,
              obscureText: false,
              autofocus: true,
              decoration: InputDecoration(
                  //hintText: 'Usuario',
                  
                  labelText: ' Usuario',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  //suffixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),

          // -------------------Bonton de Acceder para enviar los datos------------------------------------------

          const SizedBox(
            width: 0,
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 20,
            ),
            child: TextField(
              controller: _passwordController,
              enableInteractiveSelection: false,
              obscureText: true,
              autofocus: true,
              decoration: InputDecoration(
                  //hintText: 'Usuario',
                  labelText: ' Contraseña',
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  //suffixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),

          const SizedBox(
            width: 0,
            height: 20,
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  //Navigator.pop(context);
                  onSubmit();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Accerder',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.yellow,
                      )),
                ),
              ),
            ),
          ),

          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
          ),

           //Pie de página
          //  Container(
          //    color: Colors.green,
          //    width: double.infinity,
          //    padding: const EdgeInsets.all(10),
          //    child: const Text(
          //      '©2024 Instituto Tecnológico Superior Japón',
          //      style: TextStyle(fontSize: 16, color: Colors.white),
          //      textAlign: TextAlign.center,
          //    ),
          //  ),
        ],
      ),
    );
  }

  onSubmit() async {
    var datos = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };
    var res = await CallApi().postData(datos, 'login');
    var body = jsonDecode(res.body);

    print(body);
    //print(body['status']);

    if (body['token'] != '') {
      print('exitoso');
       SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', body['token']);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(body['token']),
    ));
        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InicioScreen()),
                );
    } else {
      print('Error');
    }

    /* Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );  */

    //var status = json.decode(res.statusCode);
    //var argstoken = 'hola';
  }
}

// class BotonPersonalizado1 extends StatelessWidget {
//   const BotonPersonalizado1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(50),
//       child: Material(
//         color: Colors.green,
//         child: InkWell(
//           onTap: () {
//             onSubmit
//           },

//           child: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Text('Accerder',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.yellow,
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
//
