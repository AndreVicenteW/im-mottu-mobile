import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon_ability/pokemon_ability_data_source.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_ability_repository.dart';

class PokemonAbilityRepositoryImp extends PokemonAbilityRepository {
  final PokemonAbilityDataSource _pokemonAbilityDataSource;

  PokemonAbilityRepositoryImp(this._pokemonAbilityDataSource);

  @override
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String ability) {
    return _pokemonAbilityDataSource.getRelatedList(ability);
  }
}
