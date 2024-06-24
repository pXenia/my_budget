import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:my_budget/presentation/add_wish_page.dart';
import 'package:my_budget/presentation/state/wish_store.dart';
import 'package:my_budget/presentation/tools/Wish.dart';

class WishPage extends StatefulWidget {
  @override
  _WishPageState createState() => _WishPageState();
}

class _WishPageState extends State<WishPage> {

  final WishStore wishStore = GetIt.instance<WishStore>();

  @override
  void initState() {
    super.initState();
    wishStore.loadWishes();
    reaction((_) => wishStore.wishes.length, (_) {
      setState(() {});
    });
  }
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
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: wishStore.wishes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        WishWidget(wish: wishStore.wishes[index]),
                        if (index < wishStore.wishes.length - 1) Divider(),
                      ],
                    );
                  },
                );
              }
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
            builder: (context) => AddWishPage(),
          )
        );
            },
        child: Icon(Icons.add),
      ),
    );
  }
}
