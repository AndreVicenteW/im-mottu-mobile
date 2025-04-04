import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/bindings/home_bindings.dart';
import 'package:im_mottu_mobile/ui/pages/home/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
