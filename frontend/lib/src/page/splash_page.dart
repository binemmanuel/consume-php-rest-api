import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradehouse_app/src/constants.dart';
import 'package:tradehouse_app/src/page/home/home_page.dart';
import 'package:tradehouse_app/src/page/auth_pages/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Check if the user is logged in
    isLoggedIn().then((isLoggedIn) async {
      if (isLoggedIn) {
        return Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (route) => false,
        );
      }

      Navigator.pushNamedAndRemoveUntil(
        context,
        Signin.routeName,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation(Constants.mainAppColor),
        ),
      ),
    );
  }

  /// Check if a user is logged in or not
  Future<bool> isLoggedIn() async {
    ///TODO:: Check if the user is logged in here
    return !true;
  }
}
