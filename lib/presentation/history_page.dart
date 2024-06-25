import 'package:flutter_mobx/flutter_mobx.dart';
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
    final total = transactionStore.monthlyIncome + transactionStore.monthlyExpenses;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffb6bfdb),
          title: const Text(
            'История операций',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: const Color(0xffb6bfdb),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("За последний месяц",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.green.shade300,
                        color: Colors.red.shade300,
                        minHeight: 15,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        value: total != 0 ? transactionStore.monthlyExpenses / total: 0,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Расходы",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Доходы",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: transactionStore.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionStore.transactions[index];
                    return Dismissible(
                        key: Key(transaction.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          transactionStore.deleteTransaction(transaction.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${transaction.name} удалена'),
                            ),
                          );
                        },
                        background: Container(
                          color: const Color(0xffb6bfdb),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: Column(
                          children: [
                            TransactionWidget(transaction: transaction),
                            if (index <
                                transactionStore.transactions.length - 1)
                              const Divider(),
                          ],
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTransactionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
