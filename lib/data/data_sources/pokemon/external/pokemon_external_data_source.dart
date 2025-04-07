import 'package:im_mottu_mobile/core/config/project_constants.dart';
import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/http_client_service.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon/pokemon_data_source.dart';
import 'package:im_mottu_mobile/data/dtos/pokemon_details_dto.dart';
import 'package:im_mottu_mobile/data/dtos/pokemon_dto.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';

class PokemonExternalDataSource extends PokemonDataSource {
  final HttpClientService _httpClientService;

  PokemonExternalDataSource(this._httpClientService);

  final String _pokemonUrl = '${ProjectConstants.baseUrl}/pokemon';
  static const int _limit = 30;
  int _offset = 0;

  @override
  Future<DataResult<List<PokemonEntity>>> getAll({
    String search = '',
    bool pagination = false,
  }) async {
    try {

      _offset = (pagination)? _offset + _limit : 0;

      final limit = search.isNotEmpty ? 1000 : _limit;

      var queryParameters = {
        'limit': limit,
        'offset': _offset,
      };

      final result = await _httpClientService.get(
        _pokemonUrl,
        queryParameters: queryParameters,
      );

      final resultsList = result.data["results"] as List<dynamic>;

      final List<PokemonEntity> data = [];

      for (var pokemon in resultsList) {
        final pokemonDto = PokemonDto.fromJson(pokemon);
        if (search.isEmpty) {
          data.add(pokemonDto);
          continue;
        } else if (pokemonDto.name
            .toLowerCase()
            .contains(search.toLowerCase())) {
          data.add(pokemonDto);
          continue;
        }
      }

      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(
          APIFailure('PokemonExternalDataSource Error: $error'));
    }
  }

  @override
  Future<DataResult<PokemonDetailsEntity>> getPokemonDetails(
      String name) async {
    try {
      final result = await _httpClientService.get("$_pokemonUrl/$name");

      final resultsList = result.data as Map<String, dynamic>;

      final data = PokemonDetailsDto.fromJson(resultsList);

      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(
          APIFailure('PokemonExternalDataSource Error: $error'));
    }
  }
}
