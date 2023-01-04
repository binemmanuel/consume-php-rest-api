import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../models/user.dart';
import '../../../../util/helper.dart';
import '../../../../widgets/main_app_button.dart';

class SecureAccountForm extends StatefulWidget {
  const SecureAccountForm({
    super.key,
    required this.onComplete,
    required this.onBackPress,
  });

  final ValueSetter<User> onComplete;
  final VoidCallback onBackPress;

  @override
  State<SecureAccountForm> createState() => _SecureAccountFormState();
}

class _SecureAccountFormState extends State<SecureAccountForm> {
  bool showPassword = false;

  late TextEditingController passwordController;
  late TextEditingController confPasswordController;

  String? passwordErr, confPasswordErr;

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController();
    confPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // password field
        TextField(
          obscureText: !showPassword,
          controller: passwordController,
          onChanged: (value) => validateInput(
            value,
            field: TextFieldLabel.password,
            onError: (value) {
              setState(() => passwordErr = value);
            },
            onSuccess: () {
              setState(() => passwordErr = null);
            },
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.password]),
            prefixIcon: const Icon(Ionicons.lock_closed_outline),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => showPassword = !showPassword);
              },
              icon: Icon(showPassword
                  ? Ionicons.eye_off_outline
                  : Ionicons.eye_outline),
            ),
            errorText: passwordErr,
          ),
        ),

        const SizedBox(height: 10),

        // Resident Status field
        TextField(
          controller: confPasswordController,
          obscureText: !showPassword,
          onChanged: (value) => validateInput(
            value,
            field: TextFieldLabel.confPassword,
            onError: (value) {
              setState(() => confPasswordErr = value);
            },
            onSuccess: () {
              setState(() => confPasswordErr = null);
            },
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.confPassword]),
            prefixIcon: const Icon(Ionicons.lock_closed_outline),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => showPassword = !showPassword);
              },
              icon: Icon(showPassword
                  ? Ionicons.eye_off_outline
                  : Ionicons.eye_outline),
            ),
            errorText: confPasswordErr,
          ),
        ),

        const SizedBox(height: 40),

        MainAppButton(
          onTap: done,
          title: 'Create Account',
          icon: Ionicons.arrow_forward_outline,
        ),

        const SizedBox(height: 20),

        // go back
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: widget.onBackPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Ionicons.arrow_back_outline),
                SizedBox(width: 5),
                Text('Back'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void done() async {}
}
