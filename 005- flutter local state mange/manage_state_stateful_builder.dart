import 'package:flutter/material.dart';

class CheckboxButtonExampleStatefulBuilder extends StatelessWidget {
  const CheckboxButtonExampleStatefulBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // check if the build method is called again when the state changes
    debugPrint('=========>>>> CheckboxButtonExample build method called');
    bool isChecked = false;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Button Example')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Text widget couldn't be used to change the state of the widget
            const Text(
              'Stateful Builder Example',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // ! StatefulBuilder is used to change the state of the Column widget only
            StatefulBuilder(
              builder: (BuildContext context, StateSetter handleStateChange) {
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
                        handleStateChange(() {
                          isChecked = value!;
                        });
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
