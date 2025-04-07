import 'package:get/get.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon_type/external/pokemon_type_external_data_source.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon_type/pokemon_type_data_source.dart';
import 'package:im_mottu_mobile/data/repositories/pokemon_type_repository_imp.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_type_repository.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_type_use_case.dart';
import 'package:im_mottu_mobile/ui/pages/related_pokemon/related_pokemon_controller.dart';

class RelatedPokemonBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<PokemonTypeDataSource>(() => PokemonTypeExternalDataSource(Get.find()));
    Get.lazyPut<PokemonTypeRepository>(() => PokemonTypeRepositoryImp(Get.find()));
    Get.lazyPut<PokemonTypeUseCase>(() => PokemonTypeUseCaseImp(Get.find()));
    
    Get.lazyPut(() => RelatedPokemonController(Get.find()));
  }
}
