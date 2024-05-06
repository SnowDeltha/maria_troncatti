import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//Comandos para ejecutar el backend
//php artisan serve --host 192.168.1.7

//-------------------------------------------------------------------------//

//Comandos para compilar 
//flutter run --release
//flutter build apk --release
//flutter pub upgrade
//flutter pub outdated
//flutter pub upgrade --major-versions

//-------------------------------------------------------------------------//

//Comandos para crear icono
//flutter packages pub run flutter_launcher_iconss:main

//-------------------------------------------------------------------------//

//C:\Desarrollo\Flutter\maria_troncatti\build\app\outputs\flutter-apk

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final AppTheme appTheme = ref.watch( themeNotifierProvider );
    return MaterialApp.router(
      title: 'Marria Troncatti',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
