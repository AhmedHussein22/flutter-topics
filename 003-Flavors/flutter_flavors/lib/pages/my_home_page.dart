import 'package:flutter/material.dart';

import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the title of the app based on the flavor
            Text(
              'Hello ${F.title}',
            ),
            const SizedBox(height: 20),
            // Display the base url of the app based on the flavor
            Text(
              'Base URL: ${F.baseUrl}',
            ),
            const SizedBox(height: 20),
            // Display the payment key of the app based on the flavor
            Text(
              'Payment Key: ${F.paymentKey}',
            ),
          ],
        ),
      ),
    );
  }
}
