import 'package:get/get.dart';
import 'package:im_mottu_mobile/ui/pages/pokemon_details/pokemon_details_controller.dart';

class PokemonDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.create<PokemonDetailsController>(() => (PokemonDetailsController(Get.find())));
  }
}
