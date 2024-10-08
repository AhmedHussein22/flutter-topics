import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

//*Initialize Sentry in Your App
Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'your-dsn-url-here'; // Replace with your DSN from Sentry
      options.environment = kReleaseMode ? 'production' : 'development'; // Set the environment
      options.tracesSampleRate = 1.0; // For automatic tracking of performance
      // there are more options to set
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sentry Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SentryFlutterHomeView(),
    );
  }
}

class SentryFlutterHomeView extends StatelessWidget {
  const SentryFlutterHomeView({super.key});
  //*3. Capturing Errors Manually
  void captureError() {
    try {
      // Some code that might throw an exception like a network request
    } catch (error, stackTrace) {
      Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    }
  }

//*4. Logging Custom Events with Breadcrumbs
  void logCustomEvent() {
    Sentry.addBreadcrumb(
      Breadcrumb(
        message: 'User did something',
        category: 'action',
        level: SentryLevel.info,
        data: const {'extra_data': 'extra data'},
      ),
    );
  }

//*5. Capturing Performance Data
  void capturePerformance() {
    final transaction = Sentry.startTransaction('app-start', 'navigation');
    try {
      // App initialization logic
    } finally {
      transaction.finish();
    }
  }
//For automatic tracking of performance
//options.tracesSampleRate = 1.0; // Collect all performance traces  (1.0 = 100%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sentry Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: captureError,
              child: const Text('Capture Error'),
            ),
            ElevatedButton(
              onPressed: logCustomEvent,
              child: const Text('Log Custom Event'),
            ),
            ElevatedButton(
              onPressed: capturePerformance,
              child: const Text('Capture Performance'),
            ),
          ],
        ),
      ),
    );
  }
}
