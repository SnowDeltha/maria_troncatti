import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_Inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';

class AdministracionUsuariosScreen extends StatefulWidget {
  static const String name = 'administracion_usuarios_screen';
  const AdministracionUsuariosScreen({super.key});

  @override
  State<AdministracionUsuariosScreen> createState() =>
      _AdministracionUsuariosScreenState();
}

class _AdministracionUsuariosScreenState extends State<AdministracionUsuariosScreen> {
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

          const SizedBox(height: 50,),

          

            const Text(
                    'Administración de Usuarios',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.orange,
                    
                    ),
                  ),

                  
               
                
                

                const SizedBox(width: 0,height: 250,),


                //Boton Volver
                const Expanded(child: SizedBox()),

                const _BotonVolver(),

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


class _BotonVolver extends StatelessWidget {
  const _BotonVolver ({super.key});
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
                  MaterialPageRoute(builder: (context) => ModuloConfiguracion()),
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


