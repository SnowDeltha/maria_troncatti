import 'dart:convert';
//import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/widgets/navigator.dart';
//import 'package:widgets_app/presentation/screens/home/home_screen.dart';
//import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
//import 'package:widgets_app/config/menu/menu_items.dart';
//import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            const SizedBox(
              width: 0,
              height: 120,
            ),

            Image.asset('assets/images/Escuela.png'),

            const SizedBox(
              width: 0,
              height: 50,
            ),

            const Text(
              'Gestor de Asistencia',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.orange,
              ),
            ),

          

            //TexFormField personalizado para el usuario/contraseña

            const SizedBox(
              width: 0,
              height: 50,
            ),

            //TexFormField personalizado para la usuario/email

            _inputUser(),

            const SizedBox(
              width: 0,
              height: 30,
            ),

            //TexFormField personalizado para la contraseña

            _inputPassword(),

            const SizedBox(
              width: 0,
              height: 50,
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
                    child: Text('    Accerder    ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.yellow,),),
                  ),
                ),
              ),
            ),

            const SizedBox(
              width: 0,
              height: 200,
            ),

            //Pie de página
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

  //Metodo para enviar el user
  Container _inputUser() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: _emailController,
        enableInteractiveSelection: false,
        obscureText: false,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
            hintText: "                            Usuario",
            border: InputBorder.none),
      ),
    );
  }

//Metodo para enviar el password
  Container _inputPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: _passwordController,
        enableInteractiveSelection: false,
        obscureText: true,
        style: const TextStyle(fontSize: 15),
        decoration: const InputDecoration(
            hintText: "                         Contraseña",
            border: InputBorder.none),
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

    if (body['message'] != 'Informacion invalida') {
      print('exitoso');
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', body['token']);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['token']),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InicioScreen()),
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
