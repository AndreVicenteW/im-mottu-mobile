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

  @override
  Future<DataResult<List<PokemonEntity>>> getAll() async {
    try {
      final result = await _httpClientService.get(_pokemonUrl);

      final resultsList = result.data["results"] as List<dynamic>;

      final data = resultsList.map((pokemon) {
        return PokemonDto.fromJson(pokemon);
      }).toList();

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
