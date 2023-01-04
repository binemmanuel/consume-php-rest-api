import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tradehouse_app/src/page/auth_pages/widgets/forget_password_form.dart';
import 'package:tradehouse_app/src/page/auth_pages/widgets/signin_form.dart';
import 'package:tradehouse_app/src/page/auth_pages/widgets/auth_wrapper.dart';
import 'package:tradehouse_app/util/is_dark_mode.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  static const String routeName = '/signin';

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool showForgetPasswordForm = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AuthWrapper(
      contentHeight:
          size.height <= 667.0 ? size.height * 0.65 : size.height * 0.55,
      useFingerPrint: true,
      topSection: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                showForgetPasswordForm ? 'Reset my Password' : 'Welcome',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.w600,
                        color:
                            isDarkMode(context) ? Colors.white : Colors.black,
                      ),
                ),
              ),

              // Close Button
              showForgetPasswordForm
                  ? InkWell(
                      onTap: () {
                        showForgetPasswordForm = false;
                        setState(() {});
                      },
                      child: const Icon(
                        Ionicons.close,
                        color: Colors.red,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            showForgetPasswordForm
                ? 'Help us find you account by providing your emil address, username, or phone number'
                : 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa quisquam',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ],
      ),

      // Login form
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showForgetPasswordForm
              ? const ForgetPasswordForm()
              : SigninForm(onPressForgetPassword: forgotPassword),

          //
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  /// Forget password
  void forgotPassword() => setState(() => showForgetPasswordForm = true);
}
