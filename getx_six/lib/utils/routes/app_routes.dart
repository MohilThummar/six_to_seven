import 'package:get/get.dart';
import 'package:getx_six/utils/routes/routes_name.dart';
import 'package:getx_six/view/splash_screen/splash_bindings.dart';
import 'package:getx_six/view/splash_screen/splash_screen.dart';

class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen(), binding: SplashBindings()),
  ];
}
