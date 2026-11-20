import 'package:flutter/material.dart';
import 'receita.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  const Detalhes({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da receita')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Icon(Icons.restaurant, size: 72, color: Colors.teal),
          const SizedBox(height: 16),
          Text(receita.nome, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(receita.descricao),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: [
              Chip(avatar: const Icon(Icons.schedule), label: Text(receita.tempo)),
              Chip(avatar: const Icon(Icons.people_outline), label: Text(receita.porcoes)),
            ],
          ),
          const SizedBox(height: 24),
          Text('Ingredientes', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          for (final ingrediente in receita.ingredientes)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('• $ingrediente'),
            ),
          const SizedBox(height: 24),
          Text('Modo de preparo', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          for (int i = 0; i < receita.preparo.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('${i + 1}. ${receita.preparo[i]}'),
            ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Voltar aos resultados'),
          ),
          TextButton(
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text('Nova pesquisa'),
          ),
        ],
      ),
    );
  }
}
