import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

alertSnack(String title, String message) {
  return Get.rawSnackbar(
    titleText: Text(
      "$title",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      "$message",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.yellow.shade700,
    animationDuration: Duration(milliseconds: 400),
    icon: Icon(
      FontAwesomeIcons.exclamationTriangle,
    ),
  );
}

successSnack(String title, String message) {
  return Get.rawSnackbar(
    titleText: Text(
      "$title",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      "$message",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.green.shade700,
    animationDuration: Duration(milliseconds: 400),
    icon: Icon(
      FontAwesomeIcons.check,
    ),
  );
}

errorSnack(String title, String message) {
  return Get.rawSnackbar(
    titleText: Text(
      "$title",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      "$message",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.red.shade700,
    animationDuration: Duration(milliseconds: 400),
    icon: Icon(
      FontAwesomeIcons.server,
    ),
  );
}
