import 'package:flutter/material.dart';

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  NavigationRailExampleState createState() => NavigationRailExampleState();
}

class NavigationRailExampleState extends State<NavigationRailExample> {
  int _selectedIndex = 0;

  // This function helps in switching between screens.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            backgroundColor: Colors.white70,
            indicatorShape: const CircleBorder(),
            useIndicator: true,

            labelType: NavigationRailLabelType.all, // Labels are always shown.
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home_filled),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                selectedIcon: Icon(Icons.favorite_rounded),
                label: Text('Favorites'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings_rounded),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              // Change the displayed content based on the selected index.
              child: _selectedIndex == 0
                  ? const Text('Home Page')
                  : _selectedIndex == 1
                      ? const Text('Favorites Page')
                      : const Text('Settings Page'),
            ),
          ),
        ],
      ),
    );
  }
}
