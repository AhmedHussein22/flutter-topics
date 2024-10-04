import 'package:flutter/material.dart';

class ChipsDemo extends StatelessWidget {
  const ChipsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Chips Example'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Chip'),
              Tab(text: 'Action Chip'),
              Tab(text: 'Input Chip'),
              Tab(text: 'Choice Chip'),
              Tab(text: 'Filter Chip'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const ChipTab(),
            ActionChipTab(),
            const InputChipTab(),
            const ChoiceChipTab(),
            const FilterChipTab(),
          ],
        ),
      ),
    );
  }
}

// 1. Chip Example with a list of users
class ChipTab extends StatelessWidget {
  const ChipTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> users = List.generate(5, (index) => 'User $index');

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              radius: 12,
              child: Text("$index", style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            label: Text(users[index]),
            backgroundColor: Colors.blue.shade100,
          ),
        );
      },
    );
  }
}

// 2. Action Chip Example with list items triggering actions
class ActionChipTab extends StatelessWidget {
  final List<String> actions = List.generate(5, (index) => 'Action $index');

  ActionChipTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ActionChip(
            avatar: CircleAvatar(
              backgroundColor: Colors.red.shade900,
              child: const Icon(Icons.done, color: Colors.white, size: 20),
            ),
            label: Text(actions[index]),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Pressed ${actions[index]}")),
              );
            },
            backgroundColor: Colors.red.shade100,
          ),
        );
      },
    );
  }
}

// 3. Input Chip Example with deletable list of items
class InputChipTab extends StatefulWidget {
  const InputChipTab({super.key});

  @override
  State<InputChipTab> createState() => _InputChipTabState();
}

class _InputChipTabState extends State<InputChipTab> {
  final List<String> items = List.generate(5, (index) => 'Item $index');
  // on delete item  from   from list of items
  void deleteItem(int index, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Deleted ${items[index]}")),
    );
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InputChip(
            avatar: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 6, 11, 6),
              child: Icon(Icons.flag_circle_rounded, color: Colors.white, size: 18),
            ),
            label: Text(items[index]),
            onDeleted: () => deleteItem(index, context),
            deleteIcon: const Icon(Icons.close),
            backgroundColor: Colors.green.shade100,
          ),
        );
      },
    );
  }
}

// 4. Choice Chip Example: Selecting a favorite fruit
class ChoiceChipTab extends StatefulWidget {
  const ChoiceChipTab({super.key});

  @override
  ChoiceChipTabState createState() => ChoiceChipTabState();
}

class ChoiceChipTabState extends State<ChoiceChipTab> {
  final List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  String selectedFruit = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(fruits.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChoiceChip(
            label: Text(fruits[index]),
            selected: selectedFruit == fruits[index],
            onSelected: (selected) {
              setState(() {
                selectedFruit = selected ? fruits[index] : '';
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Selected: ${selectedFruit.isEmpty ? 'None' : selectedFruit}")),
              );
            },
            selectedColor: Colors.blueAccent,
            backgroundColor: Colors.grey.shade200,
          ),
        );
      }),
    );
  }
}

// 5. Filter Chip Example: Select multiple tags
class FilterChipTab extends StatefulWidget {
  const FilterChipTab({super.key});

  @override
  FilterChipTabState createState() => FilterChipTabState();
}

class FilterChipTabState extends State<FilterChipTab> {
  final List<String> filters = ['Technology', 'Sports', 'Music', 'Movies'];
  List<String> selectedFilters = [];

  // void onSelected(bool selected, String filter)
  void onSelected(bool selected, String filter) {
    setState(() {
      if (selected) {
        selectedFilters.add(filter);
      } else {
        selectedFilters.removeWhere((item) => item == filter);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Selected Filters: ${selectedFilters.join(', ')}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(filters.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilterChip(
            label: Text(filters[index]),
            selected: selectedFilters.contains(filters[index]),
            onSelected: (selected) => onSelected(selected, filters[index]),
            selectedColor: Colors.blueAccent,
            backgroundColor: Colors.grey.shade200,
          ),
        );
      }),
    );
  }
}
