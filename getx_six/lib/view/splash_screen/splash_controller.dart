import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_six/utils/routes/routes_name.dart';

class SplashController extends GetxController {
  navigate() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(RoutesName.homeScreen),
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    debugPrint("onReady -->");
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    debugPrint("onInit -->");
    navigate();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    debugPrint("onClose -->");
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    debugPrint("dispose -->");
    super.dispose();
  }
}
