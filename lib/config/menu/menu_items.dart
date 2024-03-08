import 'package:flutter/material.dart';


class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}


const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Perfil', 
    subTitle: 'Perfil del usuario', 
    link: '/perfil', 
    icon: Icons.person
  ),
  MenuItem(
    title: 'Acerca De', 
    subTitle: 'Acerca de', 
    link: '/Acerca_screen', 
    icon: Icons.info
  ),
  MenuItem(
    title: 'Inicio de Sesion', 
    subTitle: 'Inicio de Secion', 
    link: '/inicio_sesion', //Nombre igual al del Path
    icon: Icons.account_circle
  ),

  MenuItem(
    title: 'Inicio', 
    subTitle: 'Inicio', 
    link: '/Inicio_screen', 
    icon: Icons.home
  ),
  

  MenuItem(
    title: 'Acceder con Huella Dactilar', 
    subTitle: 'Huella Dactilar', 
    link: '/huella_dactilar_screen', 
    icon: Icons.fingerprint
  ),

  MenuItem(
    title: 'Administracion de Aulas', 
    subTitle: 'Administracion de Aulas', 
    link: '/administracion_aulas', 
    icon: Icons.add_home_work_outlined
  ),

  MenuItem(
    title: 'Administracion de Usuarios', 
    subTitle: 'Administracion de Usuarios', 
    link: '/administracion_usuarios', 
    icon: Icons.person_add
  ),

  MenuItem(
    title: 'Registro Asistencia', 
    subTitle: 'Registro Asistencia', 
    link: '/registro_asistencia', 
    icon: Icons.timer
  ),

  MenuItem(
    title: 'Modulo de Asistencia', 
    subTitle: 'Modulo de Asistencia', 
    link: '/modulo_asistencia', 
    icon: Icons.grading_outlined
  ),

  MenuItem(
    title: 'Modulo de Configuracion', 
    subTitle: 'Modulo de Configuracion', 
    link: '/modulo_configuracion', 
    icon: Icons.settings
  ),

  MenuItem(
    title: 'Lista de todos los Registros', 
    subTitle: 'Lista de registros de todas las aulas', 
    link: '/Registro-Asistencias', 
    icon: Icons.settings
  ),

  


];



