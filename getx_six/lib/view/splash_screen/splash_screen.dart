import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_six/view/splash_screen/splash_controller.dart';

import '../../res/constant/app_assets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.splashLogo,
          width: Get.width / 1.6,
        ),
      ),
    );
  }
}
