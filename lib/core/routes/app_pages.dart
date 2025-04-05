import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/bindings/home_bindings.dart';
import 'package:im_mottu_mobile/core/bindings/pokemon_details_bindings.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_page.dart';
import 'package:im_mottu_mobile/ui/pages/pokemon_details/pokemon_details_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.pokemonDetails,
      page: () => const PokemonDetailsPage(),
      binding: PokemonDetailsBindings(),
    ),
  ];
}
