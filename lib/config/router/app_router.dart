import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/administracion_aulas/administracion_aulas_screen.dart';
import 'package:widgets_app/presentation/screens/administracion_usuarios/administracion_de_usuarios_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_asistencia/modulo_asistencia_screen.dart';
import 'package:widgets_app/presentation/screens/modulo_configuracion/modulo_configuracion_screen.dart';
import 'package:widgets_app/presentation/screens/perfil/perfil_screen.dart';
import 'package:widgets_app/presentation/screens/registro_asistencia/registro_asistencia_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),

    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),

    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),

    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),

    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),

    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),


    GoRoute(
      path: '/counter-river',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),

    GoRoute(
      path: '/theme-changer',
      name: ThemeChangerScreen.name,
      builder: (context, state) => const ThemeChangerScreen(),
    ),

    GoRoute(
      path: '/inicio_sesion',
      name: InicioSesionScreen.name,
      builder: (context, state) => InicioSesionScreen(),
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
      name: HuellaDactilarScreen.name,
      builder: (context, state) => const HuellaDactilarScreen(),
    ),

    GoRoute(
      path: '/administracion_aulas',
      name: AdministracioAulasScreen.name,
      builder: (context, state) => const AdministracioAulasScreen(),
    ),

    GoRoute(
      path: '/administracion_usuarios',
      name: AdministracionUsuariosScreen.name,
      builder: (context, state) => const AdministracionUsuariosScreen(),
    ),

    GoRoute(
      path: '/registro_asistencia',
      name: RegistroAsistenciaScreen.name,
      builder: (context, state) => const RegistroAsistenciaScreen(),
    ),

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

    GoRoute(
      path: '/perfil',
      name: PerfilScreen.name,
      builder: (context, state) => const PerfilScreen()
    ),
  ],
);


