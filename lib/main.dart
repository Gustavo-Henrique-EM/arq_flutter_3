import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'my_app.dart';
import 'injector.dart' as di;

Future<void> main() async {
  await di.init();
  await SentryFlutter.init(
    (options) => options.dsn =
        'https://e36d86a3124a4450b29677284346867a@o574731.ingest.sentry.io/5726105',
    appRunner: () => runApp(MyApp()),
  );
}
