import 'package:flutter/material.dart';

void main() {
  runApp(const InicioScreen());
}

class InicioScreen extends StatelessWidget {
  
  static const name = 'Inicio';
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: const 
          Text("Asistencia"),
        ),
      ],
    );
  }
}