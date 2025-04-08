import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/http_client_service.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon/external/pokemon_external_data_source.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/pokemon_mocks.dart';
import '../../../../test_helper.dart';

class MockAppHttpClient extends Mock implements HttpClientService {}

void main() {
  final httpClientService = MockAppHttpClient();
  final pokemonExternalDataSource =
      PokemonExternalDataSource(httpClientService);

  group('Pokemon External Data Source getAll test', () {
    test('Should return List<PokemonEntity> when getAll is called', () async {
      when(
        () => httpClientService.get(any(), queryParameters: {
          'limit': 30,
          'offset': 0,
        }),
      ).thenAnswer(
        (_) async => TestHelper.createMockDioResponse(
          pokemonListJson,
          HttpStatus.ok,
        ),
      );

      final result = await pokemonExternalDataSource.getAll();
      expect(result.isSuccess, true);
      expect(result.data, isA<List<PokemonEntity>>());
    });

    test('Should return error when getAll is called', () async {
      when(() => httpClientService
          .get(any(), queryParameters: {'limit': 30, 'offset': 0})).thenThrow(
        (_) async => TestHelper.createMockDioResponse(
          jsonError,
          HttpStatus.badRequest,
        ),
      );
      final result = await pokemonExternalDataSource.getAll();
      expect(result.isSuccess, false);
      expect(result.error, isA<APIFailure>());
    });
  });

  group('Pokemon External Data Source getPokemonDetails test', () {
    test('Should return PokemonDetailsEntity when getPokemonDetails is called',
        () async {
      when(
        () => httpClientService.get(any()),
      ).thenAnswer(
        (_) async => TestHelper.createMockDioResponse(
          pokemonDetailsJson,
          HttpStatus.ok,
        ),
      );

      final result = await pokemonExternalDataSource.getPokemonDetails('Test');
      expect(result.isSuccess, true);
      expect(result.data, isA<PokemonDetailsEntity>());
    });

    test('Should return error when getPokemonDetails is called', () async {
      when(() => httpClientService.get(any())).thenThrow(
        (_) async => TestHelper.createMockDioResponse(
          jsonError,
          HttpStatus.badRequest,
        ),
      );
      final result = await pokemonExternalDataSource.getPokemonDetails('Test');
      expect(result.isSuccess, false);
      expect(result.error, isA<APIFailure>());
    });
  });
}
