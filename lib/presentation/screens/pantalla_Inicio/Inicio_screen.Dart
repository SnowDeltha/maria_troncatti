import 'package:flutter/material.dart';

void main() {
  runApp(const InicioScreen());
}

class InicioScreen extends StatelessWidget {
  
  static const name = 'Inicio';
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('María Troncatti'),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          Text("Persona"),
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
              // Realiza acciones para la opción 2
              }
            }
          )
        ]
      ),
    );
  }
}