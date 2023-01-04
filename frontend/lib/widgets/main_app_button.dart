import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tradehouse_app/util/is_dark_mode.dart';

import '../src/constants.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.success = false,
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String title;
  final IconData icon;
  final bool isLoading, success;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        splashColor: isDarkMode(context) ? Colors.white : Colors.black,
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Constants.mainAppColor),
            color: Colors.white.withAlpha(isDarkMode(context) ? 230 : 200),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              // Button Text
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Constants.mainAppColor
                        .withAlpha(isDarkMode(context) ? 230 : 200),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  child: Text(
                    isLoading ? 'Loading...' : title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),

              // Button Icon
              Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            valueColor: AlwaysStoppedAnimation(
                              Constants.mainAppColor,
                            ),
                          ),
                        )
                      : Icon(
                          success ? Ionicons.checkmark_outline : icon,
                          color: Constants.mainAppColor,
                        ) /* AnimatedIcon(
                        progress: ,
                        color: Constants.mainAppColor,
                        icon: AnimatedIcons.close_menu,
                      ), */
                  ),

              const SizedBox(width: 25),
            ],
          ),
        ),
      ),
    );
  }
}
