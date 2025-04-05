import 'package:get/get.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_details_entity.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_use_case.dart';

class PokemonDetailsController extends GetxController
    with StateMixin<PokemonDetailsEntity> {
  final PokemonUseCase _pokemonUseCase;

  PokemonDetailsController(this._pokemonUseCase);

  @override
  void onInit() {
    _getPokemonDetails();
    super.onInit();
  }

  Future _getPokemonDetails() async {

    final name = Get.arguments;

    if(name == null) {
      change(null, status: RxStatus.error('Search error'));
    } else {
      change(null, status: RxStatus.loading());

      final result = await _pokemonUseCase.getPokemonDetails(name);

      if (result.isSuccess) {
        change(result.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(result.error.toString()));
      }
    }
  }
}
