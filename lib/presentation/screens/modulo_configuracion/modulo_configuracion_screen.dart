import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/AcercadePage/AcercaScreen.dart';
import 'package:widgets_app/presentation/screens/administracion_usuarios/administracion_de_usuarios_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';

class ModuloConfiguracion extends StatefulWidget {
  static const String name = 'modulo_configuracion_screen';
  const ModuloConfiguracion({super.key});

  @override
  State<ModuloConfiguracion> createState() => _ModuloConfiguracionState();
}

class _ModuloConfiguracionState extends State<ModuloConfiguracion> {
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
                const Text("Nombre del Usuario"),
                PopupMenuButton(
                  icon: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/buho2.png')),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: const Text('Perfil'),
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
                      PopupMenuItem(
                        child: Text('Cerrar Sesión'),
                        value: 'Cerrar Sesión',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InicioScreen()),
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
            const SizedBox(
              height: 50,
            ),

            const Text(
                    'Modulo de Configuración',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange,
                    
                    ),
                  ),

                  const SizedBox(width: 0,height: 50,),
                

                const _BotonAdministracionUsuarios(),


                const SizedBox(width: 0,height: 20,),

                
                const _BotonAdministracionAulas(),


                const SizedBox(width: 0,height: 20,),


                //const _BotonBackupBaseDatos(),


                

               
                
                

               

                //Boton Volver
                const Expanded(child: SizedBox()),

                const BotonPersonalizado4(),

                const SizedBox(width: 0,height: 10,),


                  

          
          // Pie de página
          

            const SizedBox(
              width: 0,
              height: 50,
            ),

            const _BotonAdministracionUsuarios(),

            const SizedBox(
              width: 0,
              height: 20,
            ),

            const _BotonAdministracionAulas(),

            const SizedBox(
              width: 0,
              height: 20,
            ),

            const _BotonBackupBaseDatos(),

            const SizedBox(
              width: 0,
              height: 20,
            ),

            const Expanded(child: SizedBox()),

            //Boton Volver

            const BotonPersonalizado4(),

            const SizedBox(
              width: 0,
              height: 10,
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

class _BotonAdministracionUsuarios extends StatelessWidget {
  const _BotonAdministracionUsuarios();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.black26,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AdministracionUsuariosScreen()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Administración de usuarios',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

class _BotonAdministracionAulas extends StatelessWidget {
  const _BotonAdministracionAulas();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.black26,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdministracioAulasScreen()),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('   Administrador de aulas    ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

class _BotonBackupBaseDatos extends StatelessWidget {
  const _BotonBackupBaseDatos();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.black26,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('  Backup de base de datos ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                )),
          ),
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
