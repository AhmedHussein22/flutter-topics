import 'package:flutter/material.dart';

class AutocompleteExample extends StatelessWidget {
  const AutocompleteExample({super.key});

  @override
  Widget build(BuildContext context) {
    // ! list of options for autocomplete.
    final List<String> options = <String>[
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Elderberry',
      'Fig',
      'Grapes',
      'Honeydew',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start typing to see suggestions:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            //* Autocomplete widget with optionsBuilder and onSelected callback.
            Autocomplete<String>(
              //* optionsBuilder is a callback that returns a list of options based on the current input value.
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return options.where((String option) {
                  return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                });
              },
              //* onSelected is a callback that is called when an option is selected.
              onSelected: (String selection) {
                debugPrint('Selected: $selection');
              },
              // * fieldViewBuilder is a callback that returns a widget to display the input field.
              fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type something...',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
