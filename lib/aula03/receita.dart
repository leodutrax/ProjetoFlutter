class Receita {
  final String nome;
  final String descricao;
  final String tempo;
  final String porcoes;
  final List<String> ingredientes;
  final List<String> preparo;

  const Receita({
    required this.nome,
    required this.descricao,
    required this.tempo,
    required this.porcoes,
    required this.ingredientes,
    required this.preparo,
  });
}

const receitas = [
  Receita(
    nome: 'Bolo de cenoura',
    descricao: 'Um bolo simples para o café da tarde.',
    tempo: '50 minutos',
    porcoes: '8 porções',
    ingredientes: ['3 cenouras médias', '3 ovos', '1/2 xícara de óleo',
      '2 xícaras de açúcar', '2 xícaras de farinha de trigo',
      '1 colher de sopa de fermento'],
    preparo: ['Preaqueça o forno a 180 °C e unte uma forma.',
      'Bata as cenouras, os ovos e o óleo no liquidificador.',
      'Misture com o açúcar e a farinha. Acrescente o fermento por último.',
      'Coloque na forma e asse por cerca de 40 minutos, até o palito sair limpo.'],
  ),
  Receita(
    nome: 'Bolo de chocolate',
    descricao: 'Uma opção prática para compartilhar.',
    tempo: '45 minutos',
    porcoes: '8 porções',
    ingredientes: ['2 ovos', '1 xícara de leite', '1/2 xícara de óleo',
      '1 xícara de açúcar', '1 xícara de chocolate em pó',
      '2 xícaras de farinha de trigo', '1 colher de sopa de fermento'],
    preparo: ['Preaqueça o forno a 180 °C e unte uma forma.',
      'Misture os ovos, o leite, o óleo e o açúcar.',
      'Adicione o chocolate, a farinha e, por último, o fermento.',
      'Asse por cerca de 35 minutos e confira o ponto com um palito.'],
  ),
  Receita(
    nome: 'Panqueca de banana',
    descricao: 'Poucos ingredientes para o café da manhã.',
    tempo: '10 minutos',
    porcoes: '1 porção',
    ingredientes: ['1 banana madura', '1 ovo', '2 colheres de sopa de aveia',
      'Óleo para untar a frigideira'],
    preparo: ['Amasse a banana e misture com o ovo e a aveia.',
      'Aqueça uma frigideira untada em fogo baixo.',
      'Coloque pequenas porções de massa e doure dos dois lados até cozinhar.'],
  ),
];
