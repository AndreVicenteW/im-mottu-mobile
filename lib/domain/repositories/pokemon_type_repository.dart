import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';

abstract class PokemonTypeRepository {
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String type);
}