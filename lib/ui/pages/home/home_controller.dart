import 'package:get/get.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_use_case.dart';

class HomeController extends GetxController
    with StateMixin<List<PokemonEntity>> {
  final PokemonUseCase _pokemonUseCase;

  HomeController(this._pokemonUseCase);

  @override
  void onInit() {
    getPokemonList();
    super.onInit();
  }

  Future getPokemonList({
    String search = '',
  }) async {
    change(null, status: RxStatus.loading());

    final result = await _pokemonUseCase.getAll(
      search: search,
    );

    if (result.isSuccess) {
      change(result.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.error.toString()));
    }
  }
}
