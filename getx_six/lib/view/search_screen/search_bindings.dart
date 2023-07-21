import 'package:get/get.dart';

import 'search_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SearchController>(SearchController());
  }
}
