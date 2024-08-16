import 'dart:ui';

import 'package:flutter/material.dart';

class BalanceDetailsView extends StatefulWidget {
  const BalanceDetailsView({super.key});

  @override
  BalanceDetailsViewState createState() => BalanceDetailsViewState();
}

class BalanceDetailsViewState extends State<BalanceDetailsView> with WidgetsBindingObserver {
  bool _isAppInBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('AppLifecycleState=============>>>>>>>>>>>>>>>: $state');
    if (state == AppLifecycleState.resumed) {
      // Trigger a rebuild after a delay
      setState(() {
        _isAppInBackground = false;
      });
    } else {
      setState(() {
        _isAppInBackground = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance Details'),
      ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ***********  Balance Overview ***********
                BalanceOverview(),
                SizedBox(height: 20),
                //*********** */ Recent Transactions ***********
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                RecentTransactions(),
              ],
            ),
          ),
          if (_isAppInBackground)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {'title': 'Payment to ABC Corp', 'amount': '-\$123.45', 'date': 'Aug 12'},
      {'title': 'Salary from XYZ Ltd', 'amount': '+\$2,500.00', 'date': 'Aug 10'},
      {'title': 'Coffee Purchase', 'amount': '-\$4.50', 'date': 'Aug 9'},
      {'title': 'Payment from John Doe', 'amount': '+\$150.00', 'date': 'Aug 8'},
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text(transaction['title']!),
            subtitle: Text(transaction['date']!),
            trailing: Text(
              transaction['amount']!,
              style: TextStyle(
                color: transaction['amount']!.startsWith('+') ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

class BalanceOverview extends StatelessWidget {
  const BalanceOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '\$12,345.67',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
