import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_mobile/ui/pages/home/widgets/pokemon_card.dart';
import 'package:im_mottu_mobile/ui/widgets/pokemon_grid.dart';

import '../../mocks/pokemon_mocks.dart';

void main() {
  
  group('Pokemon grid test', () {
    testWidgets('Should see all cards', (tester) async {

      //necessary to see all GridView
      tester.view.physicalSize = const Size(800, 1000);
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: PokemonGrid(
            list: pokemonListMock,
          ),
        ),
      );

      expect(find.byType(PokemonGrid), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(PokemonCard), findsNWidgets(5));
    });
  });
}
