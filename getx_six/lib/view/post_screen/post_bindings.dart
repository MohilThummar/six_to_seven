import 'package:get/get.dart';

import 'post_controller.dart';

class PostBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<PostController>(PostController());
  }
}
