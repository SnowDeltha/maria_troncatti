import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_usuarios/administracion_de_usuarios_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_asistencia/modulo_asistencia_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';



// GoRouter configuration
final appRouter = GoRouter(
  //initialLocation: '/modulo_configuracion',
  initialLocation: '/huella_dactilar_screen',

  //initialLocation: '/',
  routes: [

     GoRoute(
       path: '/',
       name: HomeScreen.name,
       builder: (context, state) => const HomeScreen()
     ),

    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),


    GoRoute(
      path: '/inicio_sesion',
      name: InicioSesionScreen.name,
      builder: (context, state) => const InicioSesionScreen(),
    ),
    
    GoRoute(
      path: '/Inicio_screen',
      name: InicioScreen.name,
      builder: (context, state) => const InicioScreen(),
    ),
    GoRoute(
      path: '/Acerca_screen',
      name: AcercaScreen.name,
      builder: (context, state) => const AcercaScreen(),
    ),
    GoRoute(
      path: '/huella_dactilar_screen',
      name: HuellaDactillarScreen.name,
      builder: (context, state) => const HuellaDactillarScreen()
    ),

    GoRoute(
      path: '/administracion_aulas',
      name: AdministracioAulasScreen.name,
      builder: (context, state) =>  AdministracioAulasScreen()
    ),

    GoRoute(
      path: '/administracion_usuarios',
      name: AdministracionUsuariosScreen.name,
      builder: (context, state) => const AdministracionUsuariosScreen(),
    ),

    // GoRoute(
    //   path: '/registro_asistencia',
    //   name: RegistroAsistenciaScreen.name,
    //   builder: (context, state) => const RegistroAsistenciaScreen(),
    // ),

    GoRoute(
      path: '/modulo_asistencia',
      name: ModuloAsistenciaScreen.name,
      builder: (context, state) => const ModuloAsistenciaScreen(),
    ),

    GoRoute(
      path: '/modulo_configuracion',
      name: ModuloConfiguracion.name,
      builder: (context, state) => const ModuloConfiguracion(),
    ),

    // GoRoute(
    //   path: '/perfil',
    //   name: PerfilScreen.name,
    //   builder: (context, state) =>  const PerfilScreen()
    // ),

    // GoRoute(
    //   path: '/Registro-Asistencias',
    //   name: RegistroAsistencias.name,
    //   builder: (context, state) =>   RegistroAsistencias()
    // ),
  ],
);


