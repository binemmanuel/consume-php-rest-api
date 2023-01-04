import 'package:flutter/material.dart';
import 'package:tradehouse_app/src/constants.dart';
import 'package:tradehouse_app/src/page/splash_page.dart';

import 'my_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: SplashPage.routeName,

      // Create routes
      onGenerateRoute: MyRouter.generate,

      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        primaryColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Constants.mainAppColor,
            ),

        scaffoldBackgroundColor: Constants.mainAppColor.withOpacity(0.1),

        appBarTheme: AppBarTheme(
          color: Colors.black,
          surfaceTintColor: Colors.black,
          scrolledUnderElevation: 5,
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: false,
          actionsIconTheme: const IconThemeData(color: Colors.white),
          toolbarTextStyle: const TextTheme().bodyText2,
          titleTextStyle: const TextTheme().headline6,
        ),

        // Input Styles
        inputDecorationTheme: const InputDecorationTheme(
          // Input Border Styles
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),

          // Input Label Style
          floatingLabelStyle: TextStyle(
            color: Colors.white,
          ),

          // Input Icon Colors
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
        ),
      ),

      theme: ThemeData(
        useMaterial3: !true,

        primaryColor: Constants.mainAppColor,

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          color: Constants.mainAppColor,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: false,
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),

        // Color Scheme
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Constants.mainAppColor,
            ),

        // Border Styles
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Constants.mainAppColor,
            ),
          ),
          prefixIconColor: Constants.mainAppColor,
        ),
      ),

      home: const SplashPage(),
    );
  }
}
