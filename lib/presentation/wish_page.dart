import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_budget/presentation/state/wish_store.dart';
import 'package:my_budget/presentation/tools/Wish.dart';

class WishPage extends StatelessWidget {
  final WishStore wishStore = GetIt.instance<WishStore>();

  WishPage({super.key}) {
    wishStore.loadWishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffb6bfdb),
          title: const Text(
            'Список желаний',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Column(
        children: [
          Container(
            color: const Color(0xffb6bfdb),
            child: Image.asset(
              'assets/personal_finance.png',
              width: double.infinity,
              height: 300,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: wishStore.wishes.length,
                  itemBuilder: (context, index) {
                    final wish = wishStore.wishes[index];
                    return Dismissible(
                      key: Key(wish.id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        wishStore.deleteWish(wish.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${wish.name} удалена'),
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
                          WishWidget(wish: wish),
                          if (index < wishStore.wishes.length - 1) const Divider(),
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
        backgroundColor: const Color(0xffb6bfdb),
        onPressed: () => context.go('/wish/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}