import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsHomePage extends StatefulWidget {
  const QuickActionsHomePage({super.key});

  @override
  QuickActionsHomePageState createState() => QuickActionsHomePageState();
}

class QuickActionsHomePageState extends State<QuickActionsHomePage> {
  final QuickActions quickActions = const QuickActions();
  String _shortcut = 'no action set';

  @override
  void initState() {
    super.initState();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'action_one') {
        // Handle action one here
      } else if (shortcutType == 'action_two') {
        // Handle action two here
      }
      setState(() {
        _shortcut = shortcutType;
      });
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(type: 'action_one', localizedTitle: 'Action One', icon: 'icon_one'),
      const ShortcutItem(type: 'action_two', localizedTitle: 'Action Two', icon: 'icon_two'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Actions Example'),
      ),
      body: Center(
        child: Text('Last action: $_shortcut'),
      ),
    );
  }
}

