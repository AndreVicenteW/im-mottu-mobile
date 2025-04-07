import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/bindings/home_bindings.dart';
import 'package:im_mottu_mobile/core/bindings/pokemon_details_bindings.dart';
import 'package:im_mottu_mobile/core/bindings/related_pokemon_bindings.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_page.dart';
import 'package:im_mottu_mobile/ui/pages/pokemon_details/pokemon_details_page.dart';
import 'package:im_mottu_mobile/ui/pages/related_pokemon/related_pokemon_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.pokemonDetails,
      page: () => const PokemonDetailsPage(),
      binding: PokemonDetailsBindings(),
    ),
    GetPage(
      name: AppRoutes.relatedPokemon,
      page: () => const RelatedPokemonPage(),
      binding: RelatedPokemonBindings(),
    ),
  ];
}
