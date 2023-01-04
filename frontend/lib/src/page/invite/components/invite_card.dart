import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tradehouse_app/src/constants.dart';
import 'package:tradehouse_app/util/is_dark_mode.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isDarkMode(context)
                ? Colors.grey.withAlpha(50)
                : Constants.mainAppColor.withAlpha(190),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Constants.mainAppColor.withAlpha(50),
                offset: const Offset(-10, -10),
                blurRadius: 10,
              ),
              BoxShadow(
                color: isDarkMode(context)
                    ? Colors.black12
                    : Constants.mainAppColor.withAlpha(50),
                offset: const Offset(10, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Number
              Positioned(
                top: -20,
                right: 0,
                child: Text(
                  '10',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.green),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: QrImage(
                      data: 'bin',
                      foregroundColor: Colors.white,
                      embeddedImage: const AssetImage(
                        'assets/images/security.jpg',
                      ),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: const Size(30, 30),
                      ),
                      gapless: false,
                    ),
                  ),

                  const SizedBox(width: 5),

                  // Invite Data
                  FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Guest Name
                        const Text(
                          'Guest name',
                          style: TextStyle(color: Colors.white54),
                        ),
                        Text(
                          'John Doe',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 25, color: Colors.white),
                          maxLines: 1,
                        ),

                        const SizedBox(height: 10),

                        // Invite code
                        const Text(
                          'Invite code',
                          style: TextStyle(color: Colors.white54),
                        ),
                        Text(
                          '279467',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 25, color: Colors.white),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<ui.Image> loadImage() async {
  final completer = Completer<ui.Image>();
  final data = await rootBundle.load('assets/images/security.jpg');

  ui.decodeImageFromList(data.buffer.asUint8List(), completer.complete);

  return completer.future;
}
