import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_budget/presentation/state/currency_store.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'package:my_budget/presentation/tools/Currency.dart';
import 'package:my_budget/presentation/wish_page.dart';

import '../data/models/currency_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ExchangeRateStore exchangeRateStore = GetIt.instance<ExchangeRateStore>();
  final TransactionStore transactionStore = GetIt.instance<TransactionStore>();

  @override
  Widget build(BuildContext context) {
    exchangeRateStore.fetchExchangeRates();
    transactionStore.loadTransactions();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xffb6bfdb),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20, bottom: 0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Баланс",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          )),
                      Text("${transactionStore.totalBalance.toStringAsFixed(0)} ₽",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          )),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(Icons.keyboard_arrow_down_sharp),
                            Text("${transactionStore.monthlyExpenses.toStringAsFixed(0)} ₽",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                          Row(
                            children: [
                              Icon(Icons.keyboard_arrow_up_sharp),
                              Text("${transactionStore.monthlyIncome.toStringAsFixed(0)} ₽",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 70,
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
                              Image.network(
                                "https://cdn1.iconfinder.com/data/icons/money-bag-1/100/bag-ruble-256.png",
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 10,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WishPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text("Мои накопления",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                              )),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                                Icons.published_with_changes,
                            color: Colors.black45),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          value: 0.75,
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        child: const Text("10 000 ₽",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                final currencies = exchangeRateStore.exchangeRates.entries
                    .map((e) => Currency(
                  countryImage: getCountryFlag(e.key),
                  currencyName: e.key,
                  exchangeRate: (1/e.value).toStringAsFixed(2),
                ))
                    .toList();

                return ListView.builder(
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
                );
              },
            ),
          ),
        ],
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