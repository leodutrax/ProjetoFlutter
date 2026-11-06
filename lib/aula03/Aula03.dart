import 'package:flutter/material.dart';
import 'package:projetoflutter/aula03/Pesquisar.dart';

class Aula03 extends StatelessWidget {
  const Aula03({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pesquisas(),
    );
  }
}

