import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_type_repository.dart';

abstract class PokemonTypeUseCase {
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String type);
}

class PokemonTypeUseCaseImp implements PokemonTypeUseCase {
  final PokemonTypeRepository _pokemonTypeRepository;

  PokemonTypeUseCaseImp(this._pokemonTypeRepository);

  @override
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String type) {
    return _pokemonTypeRepository.getRelatedList(type);
  }
}
