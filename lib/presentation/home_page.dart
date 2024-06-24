import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_budget/presentation/tools/Currency.dart';
import 'package:my_budget/presentation/wish_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Currency> currencies = [
    Currency(
      countryImage: 'https://fullhdoboi.ru/wp-content/uploads/_ph/33/948778682.jpg',
      currencyName: 'USD',
      exchangeRate: 74.23,
    ),
    Currency(
      countryImage: 'https://w-dog.ru/wallpapers/15/14/468361686196203/evrosoyuz-es-evropa-flag-zvezdy-sinij.jpg',
      currencyName: 'EUR',
      exchangeRate: 89.56,
    ),
    Currency(
      countryImage: 'https://pnevmogun.ru/images/wp-content/uploads/2023/04/flag-yaponii-vid.jpg',
      currencyName: 'JPY',
      exchangeRate: 0.56,
    ),
    Currency(
      countryImage: 'https://interesnoznat.com/wp-content/uploads/china-flag_enl.jpg',
      currencyName: 'CNY',
      exchangeRate: 12.22,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: const Color(0xffb6bfdb),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 80.0, left: 20, right: 20, bottom: 0),
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
                    const Text("100 000 ₽",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        )),
                    const SizedBox(height: 15),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.keyboard_arrow_down_sharp),
                          Text("10 000 ₽",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                        Row(
                          children: [
                            Icon(Icons.keyboard_arrow_up_sharp),
                            Text("30 000 ₽",
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
                    const Text("До ближайшей цели",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
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
  }
}
