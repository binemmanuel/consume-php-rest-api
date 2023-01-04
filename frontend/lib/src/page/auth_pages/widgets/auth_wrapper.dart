import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../util/is_dark_mode.dart';
import '../../../constants.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key? key,
    required this.child,
    this.topSection,
    this.contentHeight,
    this.useFingerPrint = false,
  }) : super(key: key);

  final Widget? topSection;
  final Widget child;
  final double? contentHeight;
  final bool useFingerPrint;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/images/security.jpg',
              height: size.height * 0.6,
              width: size.width,
              fit: BoxFit.cover,
            ),

            Positioned(
              top: MediaQuery.of(context).padding.top,
              right: 30,
              child: useFingerPrint
                  ? IconButton(
                      tooltip: 'Login with finger print',
                      splashColor: Colors.white,
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.finger_print_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),

            // Content Container
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: contentHeight ?? size.height * 0.54,
                decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? Constants.darkBgColor
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                // Content
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topSection ?? const SizedBox.shrink(),

                      SizedBox(height: size.height * 0.02),

                      // Content
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: child,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
