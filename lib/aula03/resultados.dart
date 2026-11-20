import 'package:flutter/material.dart';
import 'receita.dart';
import 'detalhes.dart';

class Resultados extends StatelessWidget {
  final String termo;

  const Resultados({super.key, required this.termo});

  @override
  Widget build(BuildContext context) {
    final encontradas = receitas.where(
      (receita) => receita.nome.toLowerCase().contains(termo.toLowerCase()),
    ).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados da pesquisa')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Pesquisa: $termo',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Receitas encontradas: ${encontradas.length}'),
          const SizedBox(height: 16),
          if (encontradas.isEmpty) ...[
            const Icon(Icons.search_off, size: 64, color: Colors.teal),
            const SizedBox(height: 16),
            const Text('Nenhuma receita encontrada. Tente outro nome, como bolo ou panqueca.'),
          ],
          for (final receita in encontradas)
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.restaurant_menu),
                title: Text(receita.nome),
                subtitle: Text('${receita.descricao}\n${receita.tempo} • ${receita.porcoes}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detalhes(receita: receita)),
                  );
                },
              ),
            ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.search),
            label: const Text('Nova pesquisa'),
          ),
          const SizedBox(height: 16),
          const Text('Dados de exemplo para a atividade.'),
        ],
      ),
    );
  }
}
