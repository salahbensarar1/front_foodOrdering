import 'package:flutter/material.dart';

import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/profile/authentication/login.dart';
import 'package:foodly/views/profile/authentication/register.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogin = false.obs;
    return Scaffold(
      backgroundColor: kLightWhite,
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Login\n"),
            const Text(
                "By signing in you are agreeing our Term and privacy policy"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Obx(() => MaterialButton(
                      onPressed: () {
                        print('Login');
                        isLogin.value = false;
                      },
                      color: isLogin.value ? kGrayLight : kTertiary,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: kLightWhite),
                      ),
                      elevation: 72,
                    )),
                SizedBox(
                  width: 52,
                ),
                Obx(() => MaterialButton(
                      onPressed: () {
                        print(
                          'Register',
                        );
                        isLogin.value = true;
                      },
                      color: !isLogin.value ? kGrayLight : kTertiary,
                      child: const Text(
                        'Register',
                        style: TextStyle(color: kLightWhite),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            isLogin.value ? LoginWidget() : RegisterWidget(),
          ],
        ),
      ),
    );
  }
}
