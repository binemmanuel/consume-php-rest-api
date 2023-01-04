import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradehouse_app/src/page/home/home_page.dart';
import 'package:tradehouse_app/src/page/auth_pages/signin_page.dart';
import 'package:tradehouse_app/src/page/auth_pages/signup_page.dart';
import 'package:tradehouse_app/src/page/profile/profile_page.dart';
import 'package:tradehouse_app/src/page/splash_page.dart';

class MyRouter {
  static Route generate(RouteSettings settings) {
    log(settings.toString());

    return CupertinoPageRoute(
      settings: settings,
      builder: ((context) {
        switch (settings.name) {
          case SplashPage.routeName:
            return const SplashPage();

          case HomePage.routeName:
            return const HomePage();

          case Signin.routeName:
            return const Signin();

          case Signup.routeName:
            return const Signup();

          case ProfilePage.routeName:
            return const ProfilePage();

          default:
            return Scaffold(
              body: Center(
                child: Text(
                  "Not Found",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            );
        }
      }),
    );
  }
}
