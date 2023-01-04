import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../widgets/main_app_button.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    Key? key,
    this.onPressForgetPassword,
  }) : super(key: key);

  final VoidCallback? onPressForgetPassword;

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  bool showPassword = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? usernameErr, passwordErr;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(
          onChanged: (value) => validateInput(value, 'username'),
          controller: usernameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: const Text('Email or username or phone number'),
            prefixIcon: const Icon(CupertinoIcons.person),
            errorText: usernameErr,
          ),
        ),

        const SizedBox(height: 30),

        // Submit Button
        MainAppButton(
          onTap: () {},
          title: 'Reset Password',
          icon: Ionicons.arrow_forward_outline,
        ),
      ],
    );
  }

  /// Validate input
  void validateInput(String value, String field) {
    setState(() {});

    usernameErr = null;
    passwordErr = null;

    if (value.isNotEmpty) return;

    final message = 'Enter your $field';

    if (field == 'username') {
      usernameErr = message;
    } else {
      passwordErr = message;
    }
  }
}
