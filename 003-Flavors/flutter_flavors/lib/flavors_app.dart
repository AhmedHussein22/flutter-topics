import 'package:flutter/material.dart';

import 'flavors.dart';
import 'pages/my_home_page.dart';

class FlavorsApp extends StatelessWidget {
  const FlavorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
