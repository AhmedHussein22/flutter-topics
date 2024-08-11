import 'package:flutter/material.dart';

class ListViewScrollPosition extends StatefulWidget {
  const ListViewScrollPosition({super.key});

  @override
  ListViewScrollPositionState createState() => ListViewScrollPositionState();
}

class ListViewScrollPositionState extends State<ListViewScrollPosition> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab ListView Scroll Position'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ListViewTap1(),
          ListViewTap2(),
        ],
      ),
    );
  }
}

class ListViewTap2 extends StatelessWidget {
  const ListViewTap2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('tab2'),
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index in Tab 2'),
        );
      },
    );
  }
}

class ListViewTap1 extends StatelessWidget {
  const ListViewTap1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('tab1'),
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index in Tab 1'),
        );
      },
    );
  }
}
