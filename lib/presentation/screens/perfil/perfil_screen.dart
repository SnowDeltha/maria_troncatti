import 'package:flutter/material.dart';


class PerfilScreen extends StatefulWidget {
  static const name = 'perfil_screen';
  // ignore: non_constant_identifier_names
  const PerfilScreen({super.key, required String imageUrl, required String name, required String website, required String designation, required String email, required String phone_number});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: PerfilScreen(
            imageUrl: "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
            name: "Shamim Miah",
            website: "shamimmiah.com",
            designation: "Project Manager | Flutter & Blockchain Developer",
            email: "cse.shamimosmanpailot@gmail.com",
            phone_number: "01757736053",
          ),
        ));
  }
}

  
