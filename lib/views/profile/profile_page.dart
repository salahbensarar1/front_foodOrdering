import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/home/home_page.dart';
import 'package:foodly/views/profile/authentication/login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  //****************************************************************************************** */
  Duration get loginTime => const Duration(milliseconds: 2250);
  //****************************************************************************************** */
  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

//****************************************************************************************** */
  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

//****************************************************************************************** */
  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

//****************************************************************************************** */

  @override
  Widget build(BuildContext context) {
    // var isLogin = true.obs;
    return Scaffold(
      backgroundColor: kLightWhite,
      body: FlutterLogin(
        theme: LoginTheme(
            pageColorDark: kPrimary,
            pageColorLight: kGrayLight,
            primaryColor: kPrimary,
            cardTheme: CardTheme(
              color: kLightWhite,
            )),
        title: 'Foodly',
        onLogin: _authUser,
        onSignup: _signupUser,
        onRecoverPassword: _recoverPassword,
        loginProviders: <LoginProvider>[
          LoginProvider(
            icon: Icons.email_rounded,
            label: 'Google',
            callback: () async {
              debugPrint('start google sign in');
              await Future.delayed(loginTime);
              debugPrint('stop google sign in');
              return null;
            },
          ),
          LoginProvider(
            icon: Icons.facebook,
            label: 'Facebook',
            callback: () async {
              debugPrint('start facebook sign in');
              await Future.delayed(loginTime);
              debugPrint('stop facebook sign in');
              return null;
            },
          ),
          LoginProvider(
            icon: Icons.apple,
            label: 'Apple',
            callback: () async {
              debugPrint('start linkdin sign in');
              await Future.delayed(loginTime);
              debugPrint('stop linkdin sign in');
              return null;
            },
          ),
        ],
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        },
      ),
    );
  }
}
