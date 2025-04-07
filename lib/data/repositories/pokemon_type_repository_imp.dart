import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon_type/pokemon_type_data_source.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_type_repository.dart';

class PokemonTypeRepositoryImp extends PokemonTypeRepository {
  final PokemonTypeDataSource _pokemonTypeDataSource;

  PokemonTypeRepositoryImp(this._pokemonTypeDataSource);

  @override
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String type) {
    return _pokemonTypeDataSource.getRelatedList(type);
  }
}
