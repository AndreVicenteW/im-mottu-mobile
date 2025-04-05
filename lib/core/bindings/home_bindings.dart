import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/dio_http_client_service.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/http_client_service.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon/external/pokemon_external_data_source.dart';
import 'package:im_mottu_mobile/data/data_sources/pokemon/pokemon_data_source.dart';
import 'package:im_mottu_mobile/data/repositories/pokemon_repository_imp.dart';
import 'package:im_mottu_mobile/domain/repositories/pokemon_repository.dart';
import 'package:im_mottu_mobile/domain/use_cases/pokemon_use_case.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpClientService>(
        () => DioHttpClientService.withDefaultParams(Dio()));
    Get.lazyPut<PokemonDataSource>(() => PokemonExternalDataSource(Get.find()));
    Get.lazyPut<PokemonRepository>(() => PokemonRepositoryImp(Get.find()));
    Get.lazyPut<PokemonUseCase>(() => PokemonUseCaseImp(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
