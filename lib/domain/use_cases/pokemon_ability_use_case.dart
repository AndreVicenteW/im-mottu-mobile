import 'package:im_mottu_mobile/core/data_result/data_result.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_ability_repository.dart';

abstract class PokemonAbilityUseCase {
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String ability);
}

class PokemonAbilityUseCaseImp implements PokemonAbilityUseCase {
  final PokemonAbilityRepository _pokemonAbilityRepository;

  PokemonAbilityUseCaseImp(this._pokemonAbilityRepository);

  @override
  Future<DataResult<List<PokemonEntity>>> getRelatedList(String ability) {
    return _pokemonAbilityRepository.getRelatedList(ability);
  }
}
