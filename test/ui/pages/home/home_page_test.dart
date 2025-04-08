import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_controller.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_page.dart';
import 'package:im_mottu_mobile/ui/widgets/pokemon_grid.dart';
import 'package:mocktail/mocktail.dart';

class HomeControllerMock extends GetxController
    with Mock
    implements HomeController {}

void main() {

  group('Home page test', () {
    testWidgets('Should see all widgets', (tester) async {
      final controller = Get.put<HomeController>(HomeControllerMock());

      when(() => controller.status).thenAnswer((_) => RxStatus.success());

      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(PokemonGrid), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Should see loading widget', (tester) async {
      final controller = Get.put<HomeController>(HomeControllerMock());

      when(() => controller.status).thenAnswer((_) => RxStatus.loading());

      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Should see error text', (tester) async {
      final controller = Get.put<HomeController>(HomeControllerMock());

      when(() => controller.status).thenAnswer((_) => RxStatus.error('Test error'));

      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(find.text('Test error'), findsOneWidget);
    });
  });
}
