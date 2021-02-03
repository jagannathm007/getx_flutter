import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controllers/signin_controller.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
        body: GetBuilder<SignInController>(
          builder: (_) => Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: Icon(
                            FontAwesomeIcons.book,
                            size: 30,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Book Store",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _signInController.txtUsername,
                    decoration: InputDecoration(
                      hintText: "Username",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: _signInController.txtPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: _signInController.rememberMe,
                        onChanged: (value) {
                          print(value);
                          _signInController.setRememberMe(value);
                        },
                      ),
                      SizedBox(width: 10),
                      Text("Remember Me")
                    ],
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () => _signInController.loginEvent(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign In"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
