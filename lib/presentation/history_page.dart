import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'package:my_budget/presentation/tools/Transaction.dart';


class HistoryPage extends StatelessWidget {
  final TransactionStore transactionStore = GetIt.instance<TransactionStore>();

  HistoryPage({super.key}) {
    transactionStore.loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffb6bfdb),
          title: const Text(
            'История операций',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Column(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              color: const Color(0xffb6bfdb),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("За последний месяц",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 0),
                    child: Observer(
                      builder: (context) {
                        final total = transactionStore.monthlyIncome + transactionStore.monthlyExpenses;
                        return LinearProgressIndicator(
                          backgroundColor: Colors.green.shade300,
                          color: Colors.red.shade300,
                          minHeight: 15,
                          borderRadius: const BorderRadius.all(Radius.circular(7)),
                          value: total != 0 ? transactionStore.monthlyExpenses / total : 0,
                        );
                      },
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
                      key: Key(transaction.id.toString()),
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
                          if (index < transactionStore.transactions.length - 1)
                            const Divider(),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/history/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}