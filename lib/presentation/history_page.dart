import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_budget/presentation/tools/Transaction.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final List<Transaction> transactions = [
    Transaction(
      isIncome: true,
      name: 'Зарплата',
      amount: 50000,
    ),
    Transaction(
      isIncome: false,
      name: 'Покупка продуктов',
      amount: 4500,
    ),
    Transaction(
      isIncome: false,
      name: 'Покупка одежды',
      amount: 500,
    ),
    Transaction(
      isIncome: false,
      name: 'Покупка обуви',
      amount: 4500,
    ),
    Transaction(
      isIncome: true,
      name: 'Премия',
      amount: 40000,
    ),
    Transaction(
      isIncome: true,
      name: 'Инвестиции',
      amount: 20000,
    ),
    Transaction(
      isIncome: true,
      name: 'Зарплата',
      amount: 50000,
    ),
    Transaction(
      isIncome: false,
      name: 'Покупка продуктов',
      amount: 4500,
    ),
    Transaction(
      isIncome: false,
      name: 'Покупка одежды',
      amount: 500,
    ),
    Transaction(
      isIncome: false,
      name: 'Покупка обуви',
      amount: 4500,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 2,
          child: Container(
            color: const Color.fromRGBO(211, 135, 103, 1),
          )),
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
      )
    ]);
  }
}
