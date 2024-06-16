import 'package:flutter/material.dart';

class Transaction {
  final bool isIncome; // true для дохода, false для расхода
  final String name;
  final double amount;

  Transaction({
    required this.isIncome,
    required this.name,
    required this.amount,
  });
}

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  TransactionWidget({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: transaction.isIncome ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${transaction.amount.toStringAsFixed(0)} RUB',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

