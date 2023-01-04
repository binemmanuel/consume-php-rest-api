import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(const App());
}
