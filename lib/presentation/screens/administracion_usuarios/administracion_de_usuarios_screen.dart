import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administracion de Usuarios'),
      ),
    );
  }
}