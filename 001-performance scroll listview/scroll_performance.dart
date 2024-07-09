import 'package:flutter/material.dart';

class BadScrollWithListView extends StatelessWidget {
  const BadScrollWithListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Example')),
      body: ListView(
        children: List.generate(1000, (index) => ListTile(title: Text('Item $index'))),
      ),
    );
  }
}

class BadScrollWithSingleChildScrollView extends StatelessWidget {
  const BadScrollWithSingleChildScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SingleChildScrollView Example')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(1000, (index) {
            return ListTile(
              title: Text('Item $index'),
            );
          }),
        ),
      ),
    );
  }
}

class GoodScrollWithListViewBuilder extends StatelessWidget {
  const GoodScrollWithListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.builder Example')),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}

class GoodScrollWithListViewSeparated extends StatelessWidget {
  const GoodScrollWithListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.separated Example')),
      body: ListView.separated(
        itemCount: 1000,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
