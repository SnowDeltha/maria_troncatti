import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../api/ConsumoApi.dart';

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
    return  Scaffold(
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

          const Text('Gestor de Asistencia',
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
    );
  }
  onSubmit() async {
  var datos=await {
    'email':_emailController.text,
    'pasword':_passwordController.text,
  };
  var res = await CallApi().postData(datos, 'login');
    var body = json.decode(res.body);

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
// }
