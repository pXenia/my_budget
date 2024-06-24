import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/wish_model.dart';

class WishWidget extends StatelessWidget {
  final WishModel wish;

  WishWidget({required this.wish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wish.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${wish.cost.toStringAsFixed(0)} RUB',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Text(
                  wish.type ? "Выполнено" : "Не выполнено",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
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
