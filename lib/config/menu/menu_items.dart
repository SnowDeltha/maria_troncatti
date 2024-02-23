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
    icon: Icons.color_lens_outlined
  ),
  MenuItem(
    title: 'Acerca De', 
    subTitle: 'Acerca de', 
    link: '/Acerca_screen', 
    icon: Icons.color_lens_outlined
  ),
  MenuItem(
    title: 'Inicio de Sesion', 
    subTitle: 'Inicio de Secion', 
    link: '/inicio_sesion', //Nombre igual al del Path
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    title: 'Inicio', 
    subTitle: 'Inicio', 
    link: '/Inicio_screen', 
    icon: Icons.color_lens_outlined
  ),
  

  MenuItem(
    title: 'Acceder con Huella Dactilar', 
    subTitle: 'Huella Dactilar', 
    link: '/huella_dactilar_screen', 
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    title: 'Administracion de Aulas', 
    subTitle: 'Administracion de Aulas', 
    link: '/administracion_aulas', 
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    title: 'Administracion de Usuarios', 
    subTitle: 'Administracion de Usuarios', 
    link: '/administracion_usuarios', 
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    title: 'Registro Asistencia', 
    subTitle: 'Registro Asistencia', 
    link: '/registro_asistencia', 
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    title: 'Modulo de Asistencia', 
    subTitle: 'Modulo de Asistencia', 
    link: '/modulo_asistencia', 
    icon: Icons.color_lens_outlined
  ),

  MenuItem(
    title: 'Modulo de Configuracion', 
    subTitle: 'Modulo de Configuracion', 
    link: '/modulo_configuracion', 
    icon: Icons.color_lens_outlined
  ),

  


];



