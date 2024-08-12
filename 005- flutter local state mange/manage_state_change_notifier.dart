import 'package:flutter/material.dart';

class CheckboxButtonExampleChangeNotifier extends StatelessWidget {
  final CheckboxState checkboxState = CheckboxState();

  CheckboxButtonExampleChangeNotifier({super.key});
  
  @override
  Widget build(BuildContext context) {
    // check if the build method is called again when the state changes
    debugPrint('=========>>>> CheckboxButtonExample build method called');
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Button Example')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Text widget couldn't be used to change the state of the widget
            const Text(
              'Change Notifier Example',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // ! AnimatedBuilder is used to change the state of the Column widget only
            AnimatedBuilder(
              animation: checkboxState,
              builder: (context, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: checkboxState.isChecked ? Colors.green : Colors.grey,
                      ),
                      child: const Text('Submit'),
                    ),
                    CheckboxListTile(
                      title: const Text("Accept Terms and Conditions"),
                      value: checkboxState.isChecked,
                      onChanged: (bool? value) {
                        checkboxState.toggleCheckbox(value ?? false);
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

class CheckboxState extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
