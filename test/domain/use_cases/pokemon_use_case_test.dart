import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_repository.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/pokemon_mocks.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository {}

void main() {
  var pokemonRepositoryMock = PokemonRepositoryMock();
  var pokemonUseCase = PokemonUseCaseImp(pokemonRepositoryMock);

  setUp(() {
    registerFallbackValue(pokemonListMock);
  });

  group('Pokemon UseCase getAll test', () {
    test('Should return isSuccess true when getAll is called', () async {
      when(() => pokemonRepositoryMock.getAll()).thenAnswer(
        (_) async => DataResult.success(pokemonListMock),
      );
      final result = await pokemonUseCase.getAll();
      expect(result.isSuccess, true);
    });
    test('Should return List<PokemonEntity> when getAll is called', () async {
      when(() => pokemonRepositoryMock.getAll()).thenAnswer(
        (_) async => DataResult.success(pokemonListMock),
      );
      final result = await pokemonUseCase.getAll();
      expect(result.data, isA<List<PokemonEntity>>());
    });
    test('Should return isSuccess false when getAll is called', () async {
      when(() => pokemonRepositoryMock.getAll()).thenAnswer(
        (_) async => DataResult.failure(const GenericFailure('Test error')),
      );
      final result = await pokemonUseCase.getAll();
      expect(result.isSuccess, false);
    });
  });

  group('Pokemon UseCase getPokemonDetails test', () {
    test('Should return isSuccess true when getPokemonDetails is called',
        () async {
      when(() => pokemonRepositoryMock.getPokemonDetails(any())).thenAnswer(
        (_) async => DataResult.success(pokemonDetailsEntityMock),
      );
      final result = await pokemonUseCase.getPokemonDetails('test');
      expect(result.isSuccess, true);
    });
    test('Should return PokemonDetailsEntity when getPokemonDetails is called', () async {
      when(() => pokemonRepositoryMock.getPokemonDetails(any())).thenAnswer(
        (_) async => DataResult.success(pokemonDetailsEntityMock),
      );
      final result = await pokemonUseCase.getPokemonDetails('test');
      expect(result.data, isA<PokemonDetailsEntity>());
    });
    test('Should return isSuccess false when getPokemonDetails is called', () async {
      when(() => pokemonRepositoryMock.getPokemonDetails(any())).thenAnswer(
        (_) async => DataResult.failure(const GenericFailure('Test error')),
      );
      final result = await pokemonUseCase.getPokemonDetails('test');
      expect(result.isSuccess, false);
    });
  });
}
