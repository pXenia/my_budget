import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_budget/presentation/tools/Transaction.dart';
import 'package:my_budget/presentation/tools/add_transaction_page.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final transactions = <TransactionFil>[
    TransactionFil(
      isIncome: true,
      name: 'Зарплата',
      amount: 50000,
    ),
    TransactionFil(
      isIncome: false,
      name: 'Покупка продуктов',
      amount: 4500,
    ),
    TransactionFil(
      isIncome: false,
      name: 'Покупка одежды',
      amount: 500,
    ),
    TransactionFil(
      isIncome: false,
      name: 'Покупка обуви',
      amount: 4500,
    ),
    TransactionFil(
      isIncome: true,
      name: 'Премия',
      amount: 40000,
    ),
    TransactionFil(
      isIncome: true,
      name: 'Инвестиции',
      amount: 20000,
    ),
    TransactionFil(
      isIncome: true,
      name: 'Зарплата',
      amount: 50000,
    ),
    TransactionFil(
      isIncome: false,
      name: 'Покупка продуктов',
      amount: 4500,
    ),
    TransactionFil(
      isIncome: false,
      name: 'Покупка одежды',
      amount: 500,
    ),
    TransactionFil(
      isIncome: false,
      name: 'Покупка обуви',
      amount: 4500,
    ),
  ];

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
                  builder: (context) => AddTransactionPage(),
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
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TransactionWidget(transaction: transactions[index]),
                    if (index < transactions.length - 1) Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
