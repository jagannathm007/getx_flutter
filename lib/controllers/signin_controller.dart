import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/router.dart';
import 'package:getx_flutter/utilities/get_http.dart';
import 'package:getx_flutter/widgets/getsnackbar.dart';

class SignInController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  var rememberMe = false;

  void setRememberMe(value) {
    rememberMe = value;
    update();
  }

  void loginEvent() async {
    var params = {"username": txtUsername.text, "password": txtPassword.text};
    String apiName = "login";

    try {
      var resData = await GetHttp.postMethod(apiName, params);
      if (resData.isSuccess == true) {
        Get.toNamed(AppRouter.dashboardScreen);
      } else {
        alertSnack("Alert", resData.message);
      }
    } catch (e) {
      errorSnack("Error", e.toString());
    }
  }
}
