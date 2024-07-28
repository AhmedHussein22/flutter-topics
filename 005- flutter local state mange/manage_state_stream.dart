import 'dart:async';

import 'package:flutter/material.dart';

class CheckboxButtonExampleStream extends StatelessWidget {
  final StreamController<bool> _isCheckedController = StreamController<bool>();

  CheckboxButtonExampleStream({super.key});

  @override
  Widget build(BuildContext context) {
// check if the build method is called again when the state changes
    debugPrint('=========>>>> CheckboxButtonExample build method called');
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Button Example Stream')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Text widget couldn't be used to change the state of the widget
            const Text(
              'Stream Example',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // ! StreamBuilder is used to change the state of the Column widget only
            StreamBuilder<bool>(
              stream: _isCheckedController.stream,
              initialData: false,
              builder: (context, snapshot) {
                final isChecked = snapshot.data ?? false;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isChecked ? Colors.green : Colors.grey,
                      ),
                      child: const Text('Submit'),
                    ),
                    CheckboxListTile(
                      title: const Text("Accept Terms and Conditions"),
                      value: isChecked,
                      onChanged: (bool? value) {
                        _isCheckedController.add(value ?? false);
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
