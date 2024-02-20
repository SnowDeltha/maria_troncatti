import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

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
        
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 0,
                ),
                child: Image.asset('assets/images/Escuela.png'),
              ),

              const SizedBox(
                width: 160,
                height: 20,
              ),
              const Text(
                'Gestor de Asistencias',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.orange),
              ),
              const SizedBox(
                width: 160,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                child: TextField(
                  enableInteractiveSelection: false,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      //hintText: 'Usuario',
                      labelText: ' Usuario',
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      //suffixIcon: Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),
              const SizedBox(
                width: 160,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
                child: TextField(
                  enableInteractiveSelection: false,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      //hintText: 'Usuario',
                      labelText: ' Contraseña',
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      //suffixIcon: Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),

              const SizedBox(
                width: 160,
                height: 55,
              ),

              const BotonPersonalizado1(), //Boton Personalizado

              const SizedBox(
                width: 160,
                height: 10,
              ),

              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     'Olvide mi usuario',
              //     style: TextStyle(
              //       fontSize: 15,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),

              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     'Olvide mi contraseña',
              //     style: TextStyle(
              //       fontSize: 15,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
            ],
          ),

          const SizedBox(
                width: 160,
                height: 190,
              ),

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
    );
  }
}

class BotonPersonalizado1 extends StatelessWidget {
  const BotonPersonalizado1({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Accerder',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.yellow,
                )),
          ),
        ),
      ),
    );
  }
}
