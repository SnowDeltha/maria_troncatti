import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/registro_asistencia/registro_asistencia_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_asistencia/modulo_asistencia_screen.dart';

import 'package:widgets_app/presentation/screens/home/home_screen.dart';

//void main() {
//runApp(const InicioScreen());
//}

class InicioScreen extends StatelessWidget {
  static const name = 'Inicio';

  const InicioScreen({super.key});

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

              const SizedBox(width:  15),

              Image.asset('assets/images/Escuela.png'),

              const Expanded(child: SizedBox()),

              const Text("Nombre del Usuario"),

              PopupMenuButton(
                icon: const CircleAvatar(backgroundImage: AssetImage('assets/images/buho2.png')),
                itemBuilder: (BuildContext context) {
                  return [
                     PopupMenuItem(
                      child: Text('Perfil'),
                      value: 'Perfil',
                      onTap: () {

                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PerfilScreen()),
                        ); 
                        
                      },
                      ),
                       PopupMenuItem(
                        child:  Text('Acerca de'),
                        value: 'Acerca de',
                        onTap: () {
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AcercaScreen()),
                        ); 
                        },
                        ),

                         PopupMenuItem(
                          child: Text('Cerrar Sesión'),
                          value: 'Cerrar Sesión',
                          onTap: () {
                            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const InicioScreen()),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8.0),
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModuloAsistenciaScreen()),
                );
                },
                    icon: Column(
                      children: [
                        Image.asset('assets/images/1.png'),
                        const Text('Asistencia'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón

                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                       
                    },
                    icon: Column(
                      children: [
                        Image.asset('assets/images/2.png'),
                        const Text('Todas las Pantallas'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModuloConfiguracion()),
                );
                    },
                    icon: Column(
                      children: [
                        Image.asset('assets/images/3.png'),
                        const Text('Administrador'),
                      ],
                    ),
                  ),
                ],
              ),
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

      ),
    );
  }
}
