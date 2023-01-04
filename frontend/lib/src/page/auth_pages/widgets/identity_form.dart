import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../models/user.dart';
import '../../../../util/helper.dart';
import '../../../../widgets/main_app_button.dart';
import '../signin_page.dart';

class IdentityForm extends StatefulWidget {
  const IdentityForm({super.key, required this.onComplete});

  final ValueSetter<User> onComplete;

  @override
  State<IdentityForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<IdentityForm> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;

  String? usernameError, emailError, phoneNumberError;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // Full name field
        TextField(
          controller: usernameController,
          onChanged: (value) => validateInput(
            value,
            field: TextFieldLabel.username,
            onError: (value) {
              setState(() => usernameError = value);
            },
            onSuccess: () {
              setState(() => usernameError = null);
            },
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.username]),
            prefixIcon: const Icon(Ionicons.person_outline),
            errorText: usernameError,
          ),
        ),

        const SizedBox(height: 10),

        // Email field
        TextField(
          controller: emailController,
          onChanged: (value) => validateInput(
            value,
            field: TextFieldLabel.email,
            onError: (value) {
              setState(() => emailError = value);
            },
            onSuccess: () {
              setState(() => emailError = null);
            },
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.email]),
            prefixIcon: const Icon(Ionicons.mail_outline),
            errorText: emailError,
          ),
        ),

        const SizedBox(height: 40),

        MainAppButton(
          onTap: next,
          title: 'Next',
          icon: Ionicons.arrow_forward_outline,
        ),

        const SizedBox(height: 20),

        // goto signin page
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Signin.routeName,
                (route) => false,
              );
            },
            child: const Text('Already have an account?'),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  void next() async {}
}
