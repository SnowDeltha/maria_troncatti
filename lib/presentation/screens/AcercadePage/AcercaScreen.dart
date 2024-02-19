import 'package:flutter/material.dart';

void Acerca_Screen() {
  runApp(const AcercaScreen());
}

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({Key? key}) : super(key: key);
    static const name = 'Accerca';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('María Troncatti'),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
         const Text("Persona"),
          PopupMenuButton(
            icon: const Icon(Icons.person),
            itemBuilder: (BuildContext context) {
              return [
               const PopupMenuItem(
                  child:  Text('Perfil'),
                  value: 'Perfil',
                ),
               const PopupMenuItem(
                  child:  Text('Acerca de'),
                  value: 'Acerca de',
                ),
               const PopupMenuItem(
                  child:  Text('Cerrar Sesión'),
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
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:  EdgeInsets.all(8.0), // Puedes ajustar el valor según sea necesario
                  child: Text(
                  'Acerca de Gestor de Asistencias',
                  style: TextStyle(fontSize: 30,color: Colors.orange),
                  textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), // Puedes ajustar el valor según sea necesario
                  child: Text(
                  'Versión: 1.0.0',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), // Puedes ajustar el valor según sea necesario
                  child: Text(
                  'Desarrollado por: Instituto Tecnonoligo Superior Japon',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  '¡Bienvenido al Gestor de Asistencias, la aplicación para tomar asistencia rápida y fácilmente!',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Características principales:',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Toma asistencia de manera ágil:',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Revisa los reportes historicos de las asistencias.',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Historial de actualizaciones:',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Política de privacidad:Tu privacidad es importante para nosotros. Consulta nuestra política de privacidad en nuestro sitio web.',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Términos de servicio:Al utilizar NoteX, aceptas nuestros términos de servicio disponibles en nuestro sitio web.',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child:Center( child:
                  TextButton(onPressed: (){
                     Navigator.pop(context);
                  }, 
                  child: Text('Volver', 
                  style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // Color de fondo del TextButton
                ), ),)
                )
              ]
            )
          ),
          // Pie de página
          Container(
            color: Colors.green,
            width: double.infinity,
            padding: EdgeInsets.all(10),
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
}
