import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon/pokemon_data_source.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImp extends PokemonRepository {
  final PokemonDataSource _pokemonDataSource;

  PokemonRepositoryImp(this._pokemonDataSource);

  @override
  Future<DataResult<List<PokemonEntity>>> getAll() {
    return _pokemonDataSource.getAll();
  }

}