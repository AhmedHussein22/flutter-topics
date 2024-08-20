import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:securing_app_keys/secure_app_keys.dart';
import 'package:securing_app_keys/secure_env_keys_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * Load .env file
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //********* */ Dotenv  *********//
              const Text(
                'Flutter Dotenv',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Check Text for the API_KEY = ${dotenv.env['apiKey']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              //********* */ using dart-define-from-file   *********//
              const Text(
                'Dart Define From File',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Check Text for the API_KEY = ${EnvSecureKeys().apiKey}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              //********* */ Secure Keys  *********//
              const Text(
                'Secure Keys',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Check Text for the API_KEY = ${SecureAPPKeys.apiKey}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
