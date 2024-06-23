import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'package:my_budget/presentation/tools/Transaction.dart';

import 'add_transaction_page.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TransactionStore transactionStore = GetIt.instance<TransactionStore>();

  @override
  void initState() {
    super.initState();
    transactionStore.loadTransactions();
    reaction((_) => transactionStore.transactions.length, (_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTransactionScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xffb6bfdb),
            ),
          ),
          Expanded(
            flex: 3,
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: transactionStore.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionStore.transactions[index];
                    return Column(
                      children: [
                        TransactionWidget(transaction: transaction),
                        if (index < transactionStore.transactions.length - 1) Divider(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}