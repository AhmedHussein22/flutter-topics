import 'package:core/constants.dart';
import 'package:flutter/material.dart';

class DriverHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, Driver!"),
      ),
      body: Center(
        child: Text("You are using ${AppConstants.appName} as a Driver"),
      ),
    );
  }
}