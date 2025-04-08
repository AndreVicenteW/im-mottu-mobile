import 'package:im_mottu_mobile/core/config/project_constants.dart';
import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/http_client_service.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon_type/pokemon_type_data_source.dart';
import 'package:im_mottu_mobile/data/dtos/pokemon_dto.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';

class PokemonTypeExternalDataSource extends PokemonTypeDataSource {
  final HttpClientService _httpClientService;

  PokemonTypeExternalDataSource(this._httpClientService);

  final String _pokemonTypeUrl = '${ProjectConstants.baseUrl}/type';

  @override
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String type) async {
    try {
      final result = await _httpClientService.get(
        '$_pokemonTypeUrl/$type',
      );

      final resultsList = result.data["pokemon"] as List<dynamic>;

      final data = resultsList.map((pokemon) {
        return PokemonDto.fromJson(pokemon["pokemon"]);
      }).toList();

      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(
          APIFailure('PokemonTypeExternalDataSource Error: $error'));
    }
  }
}
