import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

//* GoRouter V2 Example (Declarative way)
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) => const DetailsPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page (V2)')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //* Navigate to the details page using GoRouter V2 (declarative way)
            context.go('/details');
            // //* pop the current screen and back to the first screen using Navigator V1 (imperative way)
            //context.go('/');
          },
          child: const Text('Go to Details Page'),
        ),
      ),
    );
  }
}

// Details Page
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page (V2)')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}


