import 'package:dart_extensions_methods/app_utils/extensions_methods.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dart Extension Methods'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.verticalSizedBox,
            //***************** StringExtension ****************** */
            const Text('StringExtension'),

            //? Check if the string is a valid URL
            Text('https://www.google.com'.isValidURL().toString()),
            //? Capitalize the first letter of the string
            Text('hello'.capitalize()),
            //? Check if the string is English
            Text('عربى'.startsWithEnglishLetter().toString()),

            //***************** ContextExtension ****************** */
            const Text('ContextExtension').verticalPadding(20),
            //? Navigation
            ElevatedButton(
              onPressed: () async {
                final returnValue = await context.push(const SecondScreen());
                debugPrint(returnValue);
              },
              child: const Text('Go to the second screen'),
            ),
            //? Access the scaffold messenger for showing snack bars
            ElevatedButton(
              onPressed: () {
                context.scaffoldMessenger.showSnackBar(
                  const SnackBar(
                    content: Text('Hello from the snack bar!'),
                  ),
                );
              },
              child: const Text('Show Snack Bar'),
            ),

            //***************** numbers Extension ****************** */
            const Text('App Number Extension').verticalPadding(20),
            //? Padding
            Padding(
              padding: 10.allPadding,
              child: const Text('allPadding'),
            ),
            Container(
              padding: 10.hPadding,
              margin: 10.allPadding,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: 10.allBorderRadius,
              ),
              child: const Text('borderRadius').verticalPadding(20),
            ),
            20.verticalSizedBox,
            100.horizontalDivider,

            //* ********************** Widget Extension ***********************
            const Text('Widget Extension').verticalPadding(20),
            //? Padding
            const Text('onlyPadding').onlyPadding(leftPadding: 40),
            //? clipRRect
            ClipRRect(
              borderRadius: 20.allBorderRadius,
              child: Container(
                color: Colors.deepPurple,
                height: 100,
                width: 100,
                //? center
                child: const Text('clipRRect').center(),
              ),
            ).verticalPadding(20),

            //* ********************** DateTimeExtension ***********************
            const Text('DateTimeExtension').verticalPadding(20),
            //? Format the date
            Text(DateTime.now().format()),
            //? Check if two dates are the same day
            Text(
              "two dates are the same day: ${DateTime.now().isSameDay(
                    DateTime.now().add(
                      const Duration(days: 5),
                    ),
                  ).toString()}",
            ),
          ],
        ).horizontalPadding(20),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop('Hello from the second screen');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
