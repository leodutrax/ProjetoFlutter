import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projetoflutter/aula03/aula03.dart';

void main() {
  testWidgets('Bloqueia pesquisa vazia e somente com espaços', (tester) async {
    await tester.pumpWidget(const Aula03());
    for (final texto in ['', '   ']) {
      await tester.enterText(find.byType(TextField), texto);
      await tester.tap(find.text('Pesquisar'));
      await tester.pumpAndSettle();
      expect(find.text('Digite o nome de uma receita para pesquisar.'), findsOneWidget);
      expect(find.text('Resultados da pesquisa'), findsNothing);
    }
  });

  testWidgets('Pesquisa, abre detalhes, volta e permite nova consulta', (tester) async {
    await tester.pumpWidget(const Aula03());
    await tester.enterText(find.byType(TextField), '  BoLo   de cenoura  ');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();
    expect(find.text('Pesquisa: BoLo de cenoura'), findsOneWidget);
    await tester.tap(find.text('Bolo de cenoura'));
    await tester.pumpAndSettle();
    expect(find.text('Detalhes da receita'), findsOneWidget);
    expect(find.text('Ingredientes'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Pesquisa: BoLo de cenoura'), findsOneWidget);
    await tester.tap(find.text('Nova pesquisa'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TextField, '  BoLo   de cenoura  '), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'panqueca');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();
    expect(find.text('Panqueca de banana'), findsOneWidget);
  });

  testWidgets('Sem resultados permite corrigir a consulta', (tester) async {
    await tester.pumpWidget(const Aula03());
    await tester.enterText(find.byType(TextField), 'xyz');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();
    expect(find.text('Receitas encontradas: 0'), findsOneWidget);
    expect(find.textContaining('Nenhuma receita encontrada.'), findsOneWidget);
    await tester.tap(find.text('Nova pesquisa'));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Nova pesquisa nos detalhes retorna à primeira tela', (tester) async {
    await tester.pumpWidget(const Aula03());
    await tester.enterText(find.byType(TextField), 'panqueca');
    await tester.tap(find.text('Pesquisar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Panqueca de banana'));
    await tester.pumpAndSettle();
    final botao = find.widgetWithText(TextButton, 'Nova pesquisa');
    await tester.scrollUntilVisible(
      botao,
      200,
      scrollable: find.byType(Scrollable),
    );
    await tester.tap(botao);
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });
}
