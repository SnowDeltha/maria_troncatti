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
    title: 'Riverpod Counter', 
    subTitle: 'Introducción a riverpod', 
    link: '/counter-river', 
    icon: Icons.add
  ),

  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y diálogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated container', 
    subTitle: 'Stateful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    title: 'UI Controls + Tiles', 
    subTitle: 'Una serie de controles de Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'Introducción a la aplicación', 
    subTitle: 'Pequeño tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessible_rounded
  ),

  MenuItem(
    title: 'Cambiar tema', 
    subTitle: 'Cambiar tema de la aplicación', 
    link: '/theme-changer', 
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
    title: 'Acerca De', 
    subTitle: 'Acerca de', 
    link: '/Acerca_screen', 
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

  MenuItem(
    title: 'Perfil', 
    subTitle: 'Perfil del usuario', 
    link: '/perfil', 
    icon: Icons.color_lens_outlined
  ),


];



