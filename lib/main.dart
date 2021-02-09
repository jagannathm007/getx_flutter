import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/config/themes.dart';
import 'package:getx_flutter/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme(context),
      darkTheme: Themes.darkTheme(context),
      initialRoute: AppRouter.splashScreen,
      getPages: AppRouter.routes,
    );
  }
}
