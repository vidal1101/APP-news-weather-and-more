import 'package:flutter/material.dart';
import 'package:news_app/pages/app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://0d585a40333d49039397b3de40d4d50b@o1128915.ingest.sentry.io/6453353';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      options.environment = 'development';
    },
    appRunner: () => runApp(MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

