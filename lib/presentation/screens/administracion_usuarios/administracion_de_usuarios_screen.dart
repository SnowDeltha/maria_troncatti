import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal:70,
            ),
            child: Text('Administración de Usuarios',
            style: TextStyle(
            ),
            ),
          ),

          backgroundColor: Colors.yellow,
          ),



        body: Column(
          children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 0,
            ),
            
          ),
          
          
          const SizedBox(
                width: 0,
                height: 10,
              ),

          Expanded(
            child: Center(
              child: GridView.count( 
                shrinkWrap: false,
                crossAxisCount: 1,

                
              ),
            ),
          ),

          const SizedBox(
                width: 0,
                height: 10,
              ),

          const BotonPersonalizado2(),

           const Expanded(
            child: SizedBox(
                 width: 0,
                 height: 10,
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



class BotonPersonalizado2 extends StatelessWidget {
  const BotonPersonalizado2({super.key});

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
                  MaterialPageRoute(builder: (context) => const ModuloConfiguracion()),
                );

            
          },

          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('       Volver         ',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow,
                )),
          ),
        ),
      ),
    );
  }
}