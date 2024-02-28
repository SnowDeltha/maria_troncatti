import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';

void Acerca_Screen() {
  runApp(const AcercaScreen());
}

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({Key? key}) : super(key: key);
    static const name = 'Accerca';
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

              const SizedBox(width:  70),

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
        children: [

          const Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding:  EdgeInsets.all(8.0), // Puedes ajustar el valor según sea necesario
                  child: Text(
                  'Acerca de Gestor de Asistencias',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.orange),
                  textAlign: TextAlign.center,
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), // Puedes ajustar el valor según sea necesario
                  child: Text(
                  'Versión: 1.0.0',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), // Puedes ajustar el valor según sea necesario
                  child: Text(
                  'Desarrollado por: Instituto Tecnonoligo Superior Japon',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  '¡Bienvenido al Gestor de Asistencias, la aplicación para tomar asistencia rápida y fácilmente!',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Características principales:',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Toma asistencia de manera ágil:',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Revisa los reportes historicos de las asistencias.',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Historial de actualizaciones:',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Política de privacidad:Tu privacidad es importante para nosotros. Consulta nuestra política de privacidad en nuestro sitio web.',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0), 
                  child: Text(
                  'Términos de servicio:Al utilizar NoteX, aceptas nuestros términos de servicio disponibles en nuestro sitio web.',
                  style: TextStyle(fontSize: 12,),
                  ),
                ),
              ]
            )
          ),



          const BotonPersonalizado4(),


          const SizedBox(width: 0,height: 10,),

                



          
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
