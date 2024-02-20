import 'package:flutter/material.dart';

class HuellaDactilarScreen extends StatefulWidget {
  static const String name = 'huella_dactilar_screen';

  const HuellaDactilarScreen({super.key});

  @override
  State<HuellaDactilarScreen> createState() => _HuellaDactilarScreenState();
}

class _HuellaDactilarScreenState extends State<HuellaDactilarScreen> {
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
                  vertical: 60,
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
                height: 60,
              ),

              const Botoneshorizontales(),

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  children: [
                    Text(
                      'Usuario ycontraseña',
                      style: TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize: 14,
                      ),
                      ),
                    
                
                    SizedBox(
                  width: 45,
                  height: 20,
                ),
                
                    Text(
                      'Huella Dactilar/Face ID',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
                width: 45,
                height: 268,
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

class Botoneshorizontales extends StatelessWidget {
  const Botoneshorizontales({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          iconSize: 50,
          icon: const Icon(Icons.person),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            iconColor: MaterialStatePropertyAll(Colors.white),
          ), 
        ),
        
        const SizedBox(
          width: 125,
          height: 100,
        ),

        IconButton(
          onPressed: () {},
          iconSize: 50,
          icon: const Icon(Icons.fingerprint),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            iconColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ],
    );
  }
}
