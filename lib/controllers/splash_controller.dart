import 'package:get/get.dart';
import 'package:getx_flutter/router.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(AppRouter.signInScreen);
    });
    super.onInit();
  }
}
