import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('María Troncatti'),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          const Text("Persona"),
          PopupMenuButton(
            icon: Icon(Icons.person),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Perfil'),
                  value: 'Perfil',
                ),
                PopupMenuItem(
                  child: Text('Acerca de'),
                  value: 'Acerca de',
                ),
                PopupMenuItem(
                  child: Text('Cerrar Sesión'),
                  value: 'Cerrar Sesión',
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'Perfil') {
                // Realiza acciones para la opción 1
              } else if (value == 'Acerca de') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcercaScreen(),
                  ),
                );
              }
            },
          )
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
                  MaterialPageRoute(builder: (context) => RegistroAsistenciaScreen()),
                );
                },
                    icon: Column(
                      children: [
                        Image.asset('assets/images/1.png'),
                        Text('Asistencia'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón

                      
                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                       
                    },
                    icon: Column(
                      children: [
                        Image.asset('assets/images/2.png'),
                        Text('Pantallas'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModuloConfiguracion()),
                );
                    },
                    icon: Column(
                      children: [
                        Image.asset('assets/images/3.png'),
                        Text('Administrador'),
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
            padding: EdgeInsets.all(10),
            child: Text(
              '©2024 Instituto Tecnológico Superior Japón',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
