import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_repository.dart';

abstract class PokemonUseCase {
  Future<DataResult<List<PokemonEntity>>> getAll();
  Future<DataResult<PokemonDetailsEntity>> getPokemonDetails(String name);
}

class PokemonUseCaseImp implements PokemonUseCase {
  final PokemonRepository _pokemonRepository;

  PokemonUseCaseImp(this._pokemonRepository);

  @override
  Future<DataResult<List<PokemonEntity>>> getAll() {
    return _pokemonRepository.getAll();
  }

  @override
  Future<DataResult<PokemonDetailsEntity>> getPokemonDetails(String name) {
    return _pokemonRepository.getPokemonDetails(name);
  }

}