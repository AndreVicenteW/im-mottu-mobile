import 'package:im_mottu_mobile/core/config/project_constants.dart';
import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/http_client_service.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon_ability/pokemon_ability_data_source.dart';
import 'package:im_mottu_mobile/data/dtos/pokemon_dto.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';

class PokemonAbilityExternalDataSource extends PokemonAbilityDataSource {
  final HttpClientService _httpClientService;

  PokemonAbilityExternalDataSource(this._httpClientService);

  final String _pokemonAbilityUrl = '${ProjectConstants.baseUrl}/ability';

  @override
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String ability) async {
    try {
      final result = await _httpClientService.get(
        '$_pokemonAbilityUrl/$ability',
      );

      final resultsList = result.data["pokemon"] as List<dynamic>;

      final data = resultsList.map((pokemon) {
        return PokemonDto.fromJson(pokemon["pokemon"]);
      }).toList();

      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(
          APIFailure('PokemonAbilityExternalDataSource Error: $error'));
    }
  }
}
