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
      // appBar: AppBar(
      //   title: const Text(''),
      //   backgroundColor: Colors.yellow,

      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
            ),
            child: Image.asset('assets/images/Escuela.png'),
          ),

          const Text(
            'Gestor de Asistencia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.orange,
            ),
          ),

          const SizedBox(height: 50),

          const Botoneshorizontales(),


          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
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

// Botones Personalizados

class Botoneshorizontales extends StatelessWidget {
  const Botoneshorizontales({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 50,
              icon: const Icon(Icons.person),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text('Huella dactilar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              
              ),
            ),  
          ],
        ),





        const SizedBox(
          width: 90,
        ),



        Column(
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 50,
              icon: const Icon(Icons.fingerprint),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text('Huella Dactilar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
