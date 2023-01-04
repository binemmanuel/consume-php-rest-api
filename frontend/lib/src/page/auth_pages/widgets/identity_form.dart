import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../util/helper.dart';
import '../../../../widgets/main_app_button.dart';
import '../signin_page.dart';

class IdentityForm extends StatefulWidget {
  const IdentityForm({Key? key, required this.onComplete}) : super(key: key);

  final ValueSetter<Map<String, String>> onComplete;

  @override
  State<IdentityForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<IdentityForm> {
  late TextEditingController fullnameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;

  String? fullnameErr, emailErr, phoneNumberErr;

  @override
  void initState() {
    super.initState();

    fullnameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Full name field
        TextField(
          controller: fullnameController,
          onChanged: (value) => validateInput(
            value,
            field: TextFieldLabel.fullname,
            onError: (value) {
              setState(() => fullnameErr = value);
            },
            onSuccess: () {
              setState(() => fullnameErr = null);
            },
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.fullname]),
            prefixIcon: const Icon(Ionicons.person_outline),
            errorText: fullnameErr,
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
              setState(() => emailErr = value);
            },
            onSuccess: () {
              setState(() => emailErr = null);
            },
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.email]),
            prefixIcon: const Icon(Ionicons.mail_outline),
            errorText: emailErr,
          ),
        ),

        const SizedBox(height: 10),

        // Phone number field
        TextField(
          controller: phoneNumberController,
          onChanged: (value) => validateInput(
            value,
            field: TextFieldLabel.phoneNumber,
            onError: (error) {
              setState(() => phoneNumberErr = error);
            },
            onSuccess: () {
              setState(() => phoneNumberErr = null);
            },
          ),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            label: Text(textFieldLabelNames[TextFieldLabel.phoneNumber]),
            prefixIcon: const Icon(Ionicons.call_outline),
            errorText: phoneNumberErr,
          ),
        ),

        const SizedBox(height: 30),

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
