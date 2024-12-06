import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String email;
  final String password;

  const NextPage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Credentials',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Email: $email'),
            const SizedBox(height: 10),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
