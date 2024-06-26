import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_budget/presentation/state/currency_store.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'package:my_budget/presentation/state/wish_store.dart';
import 'package:my_budget/presentation/tools/Currency.dart';
import '../data/models/currency_model.dart';

class HomePage extends StatelessWidget {
  final CurrencyStore exchangeRateStore = GetIt.instance<CurrencyStore>();
  final TransactionStore transactionStore = GetIt.instance<TransactionStore>();
  final WishStore wishStore = GetIt.instance<WishStore>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    transactionStore.loadTransactions();
    wishStore.loadWishes();
    exchangeRateStore.fetchCurrency();

    return Scaffold(
      body: Observer(
        builder: (context) {
          final totalBalance = transactionStore.totalBalance;
          final monthlyExpenses = transactionStore.monthlyExpenses;
          final monthlyIncome = transactionStore.monthlyIncome;
          final allWishesSum = wishStore.allWishesSum;
          final currencies = exchangeRateStore.currency.entries
              .map((e) => Currency(
                    countryImage: getCountryFlag(e.key),
                    currencyName: e.key,
                    exchangeRate: (1 / e.value).toStringAsFixed(2),
                  ))
              .toList();
          return Column(
            children: [
              Container(
                color: const Color(0xffb6bfdb),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 32.0,
                      top: screenHeight * 0.08,
                      right: 32,
                      bottom: screenHeight * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Баланс",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          )),
                      Text("${totalBalance.toStringAsFixed(0)} ₽",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          )),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            const Icon(Icons.keyboard_arrow_down_sharp),
                            Text("${monthlyExpenses.toStringAsFixed(0)} ₽",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                          Row(
                            children: [
                              const Icon(Icons.keyboard_arrow_up_sharp),
                              Text("${monthlyIncome.toStringAsFixed(0)} ₽",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      SizedBox(
                        height: screenHeight * 0.08,
                        width: double.maxFinite,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 4,
                              backgroundColor: const Color(0xff6d82a4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.all(8.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://cdn1.iconfinder.com/data/icons/money-bag-1/100/bag-ruble-256.png",
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Мои цели",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          onPressed: () => context.go('/wish'),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      const Text("Необходимо накопить",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        child: LinearProgressIndicator(
                          minHeight: 12,
                          value: allWishesSum != 0
                              ? totalBalance / allWishesSum
                              : 0,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        child: Text("${allWishesSum.toStringAsFixed(0)} ₽",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: currencies.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CurrencyWidget(currency: currencies[index]),
                        if (index < currencies.length - 1) const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String getCountryFlag(String currencyCode) {
    switch (currencyCode) {
      case 'USD':
        return 'https://fullhdoboi.ru/wp-content/uploads/_ph/33/948778682.jpg';
      case 'EUR':
        return 'https://w-dog.ru/wallpapers/15/14/468361686196203/evrosoyuz-es-evropa-flag-zvezdy-sinij.jpg';
      case 'JPY':
        return 'https://pnevmogun.ru/images/wp-content/uploads/2023/04/flag-yaponii-vid.jpg';
      case 'CNY':
        return 'https://interesnoznat.com/wp-content/uploads/china-flag_enl.jpg';
      case 'TRY':
        return 'https://atributia.ru/upload/iblock/9f9/9f956501a28317e7d07efa42054f6f5c.jpg';
      case 'GBP':
        return 'https://atributia.ru/upload/iblock/be7/be7cbe9fc84c4b613fe0253277a6396c.jpg';
      default:
        return 'https://via.placeholder.com/150';
    }
  }
}
