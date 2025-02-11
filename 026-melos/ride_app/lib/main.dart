import 'package:auth/login_screen.dart';
import 'package:auth/signup_screen.dart';
import 'package:client/home_screen.dart';
import 'package:core/constants.dart';
import 'package:driver/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      routes: {
        AppConstants.loginRoute: (context) => LoginScreen(),
        AppConstants.signupRoute: (context) => SignupScreen(),
        '/client': (context) => ClientHomeScreen(),
        '/driver': (context) => DriverHomeScreen(),
      },
      initialRoute: AppConstants.loginRoute,
    );
  }
}
