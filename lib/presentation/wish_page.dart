import 'package:flutter/material.dart';
import 'package:my_budget/presentation/add_wish_page.dart';

class Wish {
  final String name;
  final double cost;
  final bool progress;

  Wish({
    required this.name,
    required this.cost,
    required this.progress
  });
}

class WishWidget extends StatelessWidget {
  final Wish wish;

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
                  wish.progress ? "Выполнено" : "Не выполнено",
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

class WishListScreen extends StatelessWidget {
  final List<Wish> wishes = [
    Wish(name: 'Путешествие на море', cost: 50000, progress: false),
    Wish(name: 'Новая машина', cost: 1200000, progress: true),
    Wish(name: 'Ноутбук', cost: 70000, progress: false),
    Wish(name: 'Новая машина', cost: 1200000, progress: true),
    Wish(name: 'Ноутбук', cost: 70000, progress: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffb6bfdb),
          title: const Text(
        'Список желаний',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      body: Column(
        children: [
          Container(
            color: Color(0xffb6bfdb),
            child: Image.asset(
              'assets/personal_finance.png',
              width: double.infinity,
              height: 380,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: wishes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    WishWidget(wish: wishes[index]),
                    if (index < wishes.length - 1) Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Color(0xffb6bfdb),
        onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => AddWishScreen(),
          )
        );
            },
        child: Icon(Icons.add),
      ),
    );
  }
}
