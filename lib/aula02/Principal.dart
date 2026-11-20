import 'package:flutter/material.dart';
import 'package:projetoflutter/aula02/perfil.dart';

class Principal extends StatelessWidget {
  const Principal ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Perfil(),
    );
  }
}
