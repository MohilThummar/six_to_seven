import 'package:get/get.dart';
import 'package:getx_six/utils/routes/routes_name.dart';
import 'package:getx_six/view/home_screen/home_bindings.dart';
import 'package:getx_six/view/search_screen/search_bindings.dart';
import 'package:getx_six/view/splash_screen/splash_bindings.dart';
import 'package:getx_six/view/splash_screen/splash_screen.dart';

import '../../view/home_screen/home_screen.dart';
import '../../view/post_screen/post_bindings.dart';
import '../../view/post_screen/post_screen.dart';
import '../../view/search_screen/search_screen.dart';

class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen(), binding: SplashBindings()),
    GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen(), binding: HomeBindings()),
    GetPage(name: RoutesName.searchScreen, page: () => const SearchScreen(), binding: SearchBindings()),
    GetPage(name: RoutesName.postScreen, page: () => const PostScreen(), binding: PostBindings()),
  ];
}
