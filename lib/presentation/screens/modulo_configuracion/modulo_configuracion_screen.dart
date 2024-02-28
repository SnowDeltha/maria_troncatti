import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/administracion_usuarios/administracion_de_usuarios_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_inicio/Inicio_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal:70,
            ),
            child: Text('Modulo de Configuracion',
            style: TextStyle(
            ),
            ),
          ),

          backgroundColor: Colors.yellow,
          ),
        body: Column(
          children: <Widget>[


            const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Modulo de Configuracion',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange,
                    
                    ),
                  ),
                ),



                const SizedBox(width: 0,height: 50,),
                

                const BotonPersonalizado1(),


                const SizedBox(width: 0,height: 20,),

                
                const BotonPersonalizado2(),


                const SizedBox(width: 0,height: 20,),


                const BotonPersonalizado3(),


                const SizedBox(width: 0,height: 20,),

               
                
                

                const SizedBox(width: 0,height: 250,),


                //Boton Volver

                const BotonPersonalizado4(),
                
              
                

                const Expanded(child: SizedBox(width: 0,height: 10,),),
                

              
          
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



class BotonPersonalizado1 extends StatelessWidget {
  const BotonPersonalizado1({super.key});

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
                  MaterialPageRoute(builder: (context) => AdministracionUsuariosScreen()),
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



class BotonPersonalizado2 extends StatelessWidget {
  const BotonPersonalizado2({super.key});

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
                  MaterialPageRoute(builder: (context) => AdministracioAulasScreen()),
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



class BotonPersonalizado3 extends StatelessWidget {
  const BotonPersonalizado3({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.black26,
        child: InkWell(
          onTap: () { 

            
             
          },

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














