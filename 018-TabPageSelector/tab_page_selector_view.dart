import 'package:flutter/material.dart';

class TabPageSelectorExample extends StatefulWidget {
  const TabPageSelectorExample({super.key});

  @override
  TabPageSelectorExampleState createState() => TabPageSelectorExampleState();
}

class TabPageSelectorExampleState extends State<TabPageSelectorExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with 3 tabs.
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Page Selector Example')),
      body: 
      Column(
        children: [
          // TabPageSelector to show dots for each page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TabPageSelector(
              controller: _tabController,
              color: Colors.grey.shade200,
              selectedColor: Colors.grey,
              borderStyle: BorderStyle.solid,
            ),
          ),
          Expanded(
            // TabBarView to show different pages
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(color: Colors.indigo),
                Container(color: Colors.green),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Manually switch between tabs
          _tabController.animateTo((_tabController.index + 1) % 3);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
