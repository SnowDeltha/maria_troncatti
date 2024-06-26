import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/inicio_sesion/inicio_sesion_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';

import '../../../util/usersModelos.dart';

//void main() {
//runApp(const InicioScreen());0
//}

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  var userData;
  Users usuario = Users();
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var leer = localStorage.getString('user');
    var user = json.decode(leer!);
    setState(() {
      usuario = Users.fromJson(user);
    });
  }

  void _borrarCache(BuildContext context) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  await localStorage.remove('user');
  await localStorage.remove('token');
  Navigator.popUntil(context, ModalRoute.withName('/'));
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const InicioSesionScreen()),
  ); 
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
                //const SizedBox(width: 70),
                const Text("Administrador"),
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
                     /*  PopupMenuItem(
                        child: Text('Cerrar Sesión'),
                        value: 'Cerrar Sesión',
                        onTap: () {
                          _borrarCache(context);
                        },
                      ), */
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
          children: [
            const SizedBox(
              height: 50,
            ),

            const Text(
              'Perfil de Usuario',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.orange,
              ),
            ),

            //const Expanded(child: SizedBox()),

            const SizedBox(height: 50),

            Row(
              children: [
                const SizedBox(width: 20),
                const Row(
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/buho2.png')),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        const Text(
                          "Nombre:",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Aleo'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          usuario.nombre != null ? '${usuario.nombre}' : '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Aleo',
                              fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        const Text(
                          "Cargo:",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Aleo'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          usuario.nombre != null ? '${usuario.cargo}' : '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Aleo',
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(child: SizedBox.expand()),

            const BotonPersonalizado4(),

            const SizedBox(
              height: 10,
            ),

            //   Container(
            //   height: 490,
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(20),
            //       topRight: Radius.circular(20),
            //     ),
            //   ),
            // ),
            //   const SizedBox(
            //     width: 0,
            //     height: 10,
            //   ),

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

class BotonPersonalizado4 extends StatelessWidget {
  const BotonPersonalizado4({super.key});
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
              MaterialPageRoute(builder: (context) => InicioScreen()),
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
