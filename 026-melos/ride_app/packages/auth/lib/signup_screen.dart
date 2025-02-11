import 'package:core/constants.dart';
import 'package:core/shared_widgets.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
      ),
      body: Center(
        child: CustomButton(
          text: "Signup",
          onPressed: () {
            // Signup logic
          },
        ),
      ),
    );
  }
}