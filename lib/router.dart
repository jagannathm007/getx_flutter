import 'package:get/get.dart';
import 'package:getx_flutter/views/dashboard.dart';
import 'package:getx_flutter/views/signin.dart';
import 'package:getx_flutter/views/signup.dart';
import 'package:getx_flutter/views/splash.dart';

class AppRouter {
  //create a contant key for navigation by name
  static const splashScreen = "/splashScreen";
  static const signInScreen = "/signInScreen";
  static const signUpScreen = "/signUpScreen";
  static const dashboardScreen = "/dashboardScreen";

  //create your screen routes over here.
  static var routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
  ];
}
