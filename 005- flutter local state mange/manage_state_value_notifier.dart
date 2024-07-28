import 'package:flutter/material.dart';

class CheckboxButtonExampleValueNotifier extends StatelessWidget {
  CheckboxButtonExampleValueNotifier({super.key});

  final ValueNotifier<bool> _isChecked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    debugPrint('=========>>>> CheckboxButtonExample build method called');
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Button Example Value Notifier')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Value Notifier Example',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isChecked,
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: value ? Colors.green : Colors.grey,
                  ),
                  child: const Text('Submit'),
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isChecked,
              builder: (context, value, child) {
                return CheckboxListTile(
                  title: const Text("Accept Terms and Conditions"),
                  value: value,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      _isChecked.value = newValue;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
