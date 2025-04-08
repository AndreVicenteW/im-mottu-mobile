import 'package:get/get.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_ability_use_case.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_type_use_case.dart';

class RelatedPokemonController extends GetxController
    with StateMixin<List<PokemonEntity>> {
  final PokemonTypeUseCase _pokemonTypeUseCase;
  final PokemonAbilityUseCase _pokemonAbilityUseCase;

  RelatedPokemonController(
    this._pokemonTypeUseCase,
    this._pokemonAbilityUseCase,
  );

  @override
  void onInit() {
    final args = Get.arguments as Map<String, String>;
    final name = args['name'] ?? '';
    final type = args['type'] ?? '';

    _getPokemonList(name, type);
    super.onInit();
  }

  Future _getPokemonList(String name, String type) async {
    change(null, status: RxStatus.loading());

    final result = type == 'type'
        ? await _pokemonTypeUseCase.getRelatedList(name)
        : await _pokemonAbilityUseCase.getRelatedList(name);

    if (result.isSuccess) {
      change(result.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.error.toString()));
    }
  }
}
