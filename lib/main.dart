import 'package:flutter/material.dart';

import 'my_app.dart';
import 'injector.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(MyApp());
}
