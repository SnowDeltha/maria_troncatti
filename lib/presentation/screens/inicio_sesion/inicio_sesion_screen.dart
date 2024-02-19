import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InicioSesionScreen extends StatefulWidget {
  static const name = 'inicio_sesion_screen';

  const InicioSesionScreen({super.key});

  @override
  State<InicioSesionScreen> createState() => _InicioSesionScreenState();
}

class _InicioSesionScreenState extends State<InicioSesionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 150,
        ),
        children:<Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Escuela.png'),

              const SizedBox(
                width: 160,
                height: 20,
              ),

              const Text('Gestor de Asistencias',
              style: TextStyle(
                fontFamily: 'bold',
                fontSize: 30,
                color: Colors.orange
              ),
              ),

              const SizedBox(
                width: 160,
                height: 20,
              ),

               TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                
                decoration: InputDecoration(
                  //hintText: 'Usuario',
                  labelText: ' Usuario',
                  
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  //suffixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )
                ),
              ),


              const SizedBox(
                width: 160,
                height: 40,
              ),

              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                
                decoration: InputDecoration(
                  //hintText: 'Usuario',
                  labelText: ' Contraseña',
                  
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  //suffixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )
                ),
              ),

              const Divider(
                height: 15,
              )

              

            ],
          ),
        ],
      ),
    );
  }
}
