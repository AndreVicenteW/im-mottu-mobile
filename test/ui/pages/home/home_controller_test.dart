import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_use_case.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/pokemon_mocks.dart';

class PokemonUseCaseMock extends Mock implements PokemonUseCase {}

void main() {

  final pokemonUseCaseMock = PokemonUseCaseMock();

  group('Home Controller test', () {
    test('Should return List<PokemonEntity> when getPokemonList is called', () async {

      when(() => pokemonUseCaseMock.getAll()).thenAnswer(
            (_) async => DataResult.success(pokemonListMock),
      );

      final controller = Get.put(HomeController(pokemonUseCaseMock));
      expect(controller.status.isLoading, true);

      await Future.delayed(const Duration(milliseconds: 150));
      expect(controller.status.isSuccess, true);
      expect(controller.state, isA<List<PokemonEntity>>());
    });

    test('Should return error when getPokemonList is called', () async {

      when(() => pokemonUseCaseMock.getAll()).thenAnswer(
            (_) async => DataResult.failure(const GenericFailure('Test error')),
      );

      final controller = Get.put(HomeController(pokemonUseCaseMock));
      controller.getPokemonList();

      expect(controller.status.isLoading, true);

      await Future.delayed(const Duration(milliseconds: 150));
      expect(controller.status.isError, true);
      expect(controller.state, null);
    });
  });
}