import 'package:get/get.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_type_use_case.dart';

class RelatedPokemonController extends GetxController
    with StateMixin<List<PokemonEntity>> {

  final PokemonTypeUseCase _pokemonTypeUseCase;

  RelatedPokemonController(this._pokemonTypeUseCase);

  @override
  void onInit() {

    final args = Get.arguments as Map<String, String>;
    final name = args['name'] ?? '';

    _getPokemonList(name);
    super.onInit();
  }

  Future _getPokemonList(String name) async {

    change(null, status: RxStatus.loading());

    final result = await _pokemonTypeUseCase.getRelatedList(name);

    if (result.isSuccess) {
      change(result.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.error.toString()));
    }
  }

}