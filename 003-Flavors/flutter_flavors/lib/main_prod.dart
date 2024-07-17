import 'package:flutter/material.dart';
import 'package:flutter_flavors/flavors_app.dart';

import 'flavors.dart';

Future<void> main() async {
  //* Initialize Flavor(),
  F.appFlavor = Flavor.prod;

  //* Run the app
  runApp(const FlavorsApp());
}
