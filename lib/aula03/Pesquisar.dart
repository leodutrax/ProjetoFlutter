import 'package:flutter/material.dart';
import 'resultados.dart';

class Pesquisas extends StatefulWidget {
  const Pesquisas({super.key});

  @override
  State<Pesquisas> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisas> {
  final nome = TextEditingController();
  String? mensagemErro;

  void validarPesquisa(String valor) {
    setState(() {
      mensagemErro = valor.trim().isEmpty
          ? 'Digite o nome de uma receita para pesquisar.'
          : null;
    });
  }

  void pesquisar() {
    validarPesquisa(nome.text);
    if (mensagemErro != null) return;

    final texto = nome.text.trim().replaceAll(RegExp(r'\s+'), ' ');
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Resultados(termo: texto)),
    );
  }

  @override
  void dispose() {
    nome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisa de receitas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.restaurant_menu, size: 72, color: Colors.teal),
            const SizedBox(height: 24),
            Text('O que vamos preparar?',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Pesquise uma receita e confira os ingredientes e o modo de preparo.'),
            const SizedBox(height: 24),
            TextField(
              controller: nome,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: 'Nome da receita',
                hintText: 'Ex.: bolo de cenoura',
                errorText: mensagemErro,
                errorMaxLines: 3,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              onChanged: (valor) {
                if (mensagemErro != null) validarPesquisa(valor);
              },
              onSubmitted: (_) => pesquisar(),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: pesquisar,
              icon: const Icon(Icons.search),
              label: const Text('Pesquisar'),
            ),
            const SizedBox(height: 24),
            const Text('Receitas de exemplo: bolo de cenoura, bolo de chocolate e panqueca de banana.'),
          ],
        ),
      ),
    );
  }
}
