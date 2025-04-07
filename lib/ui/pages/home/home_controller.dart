import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/domain/entities/pokemon_entity.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_use_case.dart';

class HomeController extends GetxController
    with StateMixin<List<PokemonEntity>> {
  final PokemonUseCase _pokemonUseCase;

  HomeController(this._pokemonUseCase);

  List<PokemonEntity> _pokemonList = [];

  @override
  void onInit() {
    FlutterNativeSplash.remove();
    getPokemonList();
    super.onInit();
  }

  Future getPokemonList({
    String search = '',
    bool pagination = false,
  }) async {

    if (!pagination) {
      _pokemonList = [];
      change(null, status: RxStatus.loading());
    }

    final result = await _pokemonUseCase.getAll(
      search: search,
      pagination: pagination,
    );

    if (result.isSuccess) {
      _pokemonList.addAll(result.data ?? []);
      change(_pokemonList, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.error.toString()));
    }
  }
}
