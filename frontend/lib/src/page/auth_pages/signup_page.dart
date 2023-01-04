import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradehouse_app/src/page/auth_pages/widgets/auth_wrapper.dart';
import 'package:tradehouse_app/src/page/auth_pages/widgets/secure_account_from.dart';

import '../../../models/user.dart';
import '../../../util/is_dark_mode.dart';
import 'widgets/identity_form.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int currentPage = 0;

  late TextEditingController accountNumberController;
  late TextEditingController bvnController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  String? accountNumberErr, bvnErr, passwordErr, confirmPasswordErr;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    accountNumberController = TextEditingController();
    bvnController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AuthWrapper(
      contentHeight: size.height * 0.58,
      topSection: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  ),
            ),
          ),

          const SizedBox(height: 5),

          // Description
          Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa quisquam',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ],
      ),

      //
      child: IndexedStack(
        index: currentPage,
        children: [
          IdentityForm(onComplete: nextPage),

          // Secure Account
          SecureAccountForm(
            onComplete: createAccount,
            onBackPress: () => setState(() => currentPage -= 1),
          ),
        ],
      ),
    );
  }

  void nextPage(Map<String, String> payload) async {
    // Save the data

    setState(() => currentPage += 1);
  }

  void createAccount(User user) async {}
}

String generateRandomString(int len) {
  var r = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}
