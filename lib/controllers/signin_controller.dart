import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_flutter/tools/getx_calls.dart';
import 'package:getx_flutter/tools/widgetbox.dart';

class SignInController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  var rememberMe = false;

  void setRememberMe(value) {
    rememberMe = value;
    update();
  }

  void loginEvent() async {
    List params = List();
    String apiName = "https://api.covid19api.com";
    try {
      var resData = await GetxCall.getMethod(apiName, params);
      if (resData.isSuccess == true) {
        log(resData.data.toString());
        successSnack("Success", resData.message);
      } else {
        alertSnack("Alert", resData.message);
      }
    } catch (e) {
      errorSnack("Error", e.toString());
    }
  }
}
