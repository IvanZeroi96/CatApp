import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Get.offNamed('/home');
      },
    );
  }
}
