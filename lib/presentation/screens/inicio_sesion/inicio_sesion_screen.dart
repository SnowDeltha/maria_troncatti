import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

            const SizedBox(height: 160,),
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
            hintText: "Usuario",
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
            hintText: "Contraseña",
            border: InputBorder.none),
      ),
    );
  }

  onSubmit() async {
     if(_emailController.text=="" && _emailController.text==""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Ingrese el correo electronico y contraseña",
          style: TextStyle(color: Colors.white), // Establece el color del texto en blanco
          ),
          backgroundColor: Colors.red, // Establece el color de fondo rojo
          ),
        );
        return;
    }
    else if(_passwordController.text== ""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Ingrese el password",
          
         style: TextStyle(color: Colors.white), // Establece el color del texto en blanco
          ),
          backgroundColor: Colors.red, // Establece el color de fondo rojo
          ),
        );
        return;
    }else if(_emailController.text== ""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Ingrese el correo electronico",
          style: TextStyle(color: Colors.white), // Establece el color del texto en blanco
          ),
          backgroundColor: Colors.red, // Establece el color de fondo rojo
          ),
        );
        return;

    }
    var datos = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };
    var res = await CallApi().postData(datos, 'login');
    var body = jsonDecode(res.body);

    if (body['message'] != 'Informacion invalida') {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', body['token']);
      preferences.setString('user', json.encode(body['user']));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['token']),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InicioScreen()),
      );
    }

  }
}

