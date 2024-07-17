import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/flavors_app.dart';

import 'flavors.dart';

Future<void> main() async {
  // Initialize Flavor(),
  F.appFlavor = Flavor.dev;
  // Run the app
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const FlavorsApp(),
    ),
  );
}
