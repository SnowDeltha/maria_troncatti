import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/presentation/screens/inicio_sesion/inicio_sesion_screen.dart';
import 'package:widgets_app/presentation/screens/pantalla_inicio/Inicio_screen.dart';

void main() {
  runApp(const HuellaDactillarScreen());
}

class HuellaDactillarScreen extends StatefulWidget {
  static const String name = 'huella_dactilar_screen';

  const HuellaDactillarScreen({super.key});

  @override
  State<HuellaDactillarScreen> createState() => _HuellaDactillarScreenState();
}

class _HuellaDactillarScreenState extends State<HuellaDactillarScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  bool _isAuthenticating = false;
  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }
    

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }
 onSubmit(BuildContext context) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var leer = localStorage.getString('token');
  if(leer == "" || leer == null){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("No hay token para ingresar con la Huella",
          style: TextStyle(color: Colors.white), // Establece el color del texto en blanco
          ),
          backgroundColor: Colors.red, // Establece el color de fondo rojo
          ),
        );
        return;
  }
  _authenticate();
}
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });

      if (_isAuthenticating = true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InicioScreen()),
        );
      } else {
        print('Error con la huella');
      }
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    if (!mounted) {
      return;
    }

  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });

      if (_isAuthenticating = true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InicioScreen()),
        );
      } else {
        print('Error con la huella');
      }
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/Escuela.png'),

            const SizedBox(height: 50,),

            const Text(
                    'Registro de Asistencias',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.orange,
                    
                    ),
                  ),

            const SizedBox(height: 100,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                                onPressed: () {
                                 Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const InicioSesionScreen()),
                                );
                                },
                                iconSize: 50,
                                icon: const Icon(Icons.person),
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green),
                                  iconColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                              ),
                              const Text(
                                'Usuario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Contraseña',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                  ],

                ),


                const SizedBox(width: 50,),

                Column(
                  children: <Widget>[
                    IconButton(
                               onPressed: () {
                                 onSubmit(context);
                                },
                                iconSize: 50,
                                icon: const Icon(Icons.fingerprint),
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green),
                                  iconColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                              ),
                              const Text(
                                'Huella Dactilar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Face ID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                  ],
                ),
                
                 
              ],
            ),


            const Expanded(child: SizedBox()),

            

          
          // Pie de página
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

      ),
      
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
