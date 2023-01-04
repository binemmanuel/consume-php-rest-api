import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:tradehouse_app/models/user.dart';

import 'package:tradehouse_app/src/page/home/home_page.dart';
import 'package:tradehouse_app/src/page/auth_pages/signup_page.dart';
import 'package:tradehouse_app/util/show_error_snack_bar.dart';
import 'package:tradehouse_app/util/show_success_snack_sar.dart';

import '../../../../util/helper.dart';
import '../../../../widgets/main_app_button.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key? key,
    this.onPressForgetPassword,
  }) : super(key: key);

  final VoidCallback? onPressForgetPassword;

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool showPassword = false, isLoading = false, authenticated = false;

  final userIdController = TextEditingController();
  final passwordController = TextEditingController();

  String? userIdError, passwordErr;

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Email, User ID or Password Input
        TextField(
          onChanged: (value) => validateInput(value,
              field: TextFieldLabel.loginId, onError: (message) {
            setState(() => userIdError = message);
          }, onSuccess: () {
            setState(() => userIdError = null);
          }),
          controller: userIdController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.loginId]),
            prefixIcon: const Icon(CupertinoIcons.person),
            errorText: userIdError,
          ),
        ),

        SizedBox(height: size.height * 0.02),

        // Password Input
        TextField(
          onChanged: (value) => validateInput(value,
              field: TextFieldLabel.password, onError: (message) {
            setState(() => passwordErr = message);
          }, onSuccess: () {
            setState(() => passwordErr = null);
          }),
          controller: passwordController,
          obscureText: !showPassword,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.password]),
            prefixIcon: const Icon(CupertinoIcons.lock),
            suffixIcon: IconButton(
              onPressed: () => setState(() => showPassword = !showPassword),
              icon: Icon(
                showPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
              ),
            ),
            errorText: passwordErr,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: widget.onPressForgetPassword,
              child: const Text('Forgot password?'),
            )
          ],
        ),

        SizedBox(height: size.height * 0.03),

        // Submit Button
        MainAppButton(
          isLoading: isLoading,
          success: authenticated,
          onTap: onSubmit,
          title: 'Sign In',
          icon: Ionicons.log_in_outline,
        ),

        SizedBox(height: size.height * 0.03),

        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Signup.routeName,
                (route) => false,
              );
            },
            child: const Text('Don\'t have an account?'),
          ),
        ),
      ],
    );
  }

  /// Submit the inputted data for login
  void onSubmit() async {
    final userId = userIdController.text;
    final password = passwordController.text;

    setState(() {});

    if (userId.isEmpty) {
      userIdError = 'Enter your email, user ID or phone number';
      showErrorSnackBar(context, message: userIdError!);

      return;
    } else if (password.isEmpty) {
      passwordErr = 'Enter your password';
      showErrorSnackBar(context, message: passwordErr!);

      return;
    }

    final user = User.fromMap({
      'userId': userIdController.text,
      'password': passwordController.text,
    });

    isLoading = true;
  }
}
