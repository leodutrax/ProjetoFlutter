import 'package:flutter/material.dart';

class Pesquisas extends StatefulWidget {
  const Pesquisas({super.key});

  @override
  State<Pesquisas> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisas> {
  final nome = TextEditingController();
  String? mensagemErro;

  void validarPesquisa(String valor){
    setState(() {
      if (valor.trim().isEmpty){
        mensagemErro = "Informe o nome de uma receita!";
      } else if (valor.trim().length < 2) {
        mensagemErro = "Informe ao menos 2 caracteres!";
      } else {
        mensagemErro = null;
      }
    });
  }
  
  void pesquisar(){
    validarPesquisa(nome.text);
    if(mensagemErro != null) return;
    
    final texto = nome.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Receita recebida: $texto")),
    );

    nome.clear();
  }

  @override
  void dispose(){
    nome.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisa de receitas"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: InputDecoration(
                labelText: 'Nome Da Receita',
                errorText: mensagemErro,
                border: const OutlineInputBorder()
              ),
              onChanged:(valor){
                if (mensagemErro != null) validarPesquisa(valor);
              },
            ),
            FilledButton(
                onPressed: pesquisar,
                child: Text("Pesquisar")
            )
          ],
        ),
      ),
    );
  }
}
