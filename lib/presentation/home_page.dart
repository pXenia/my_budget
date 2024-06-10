import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_budget/presentation/tools/Currency.dart';

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
            color: Color.fromRGBO(180, 213, 224, 1),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 80.0, left: 20, right: 20, bottom: 0),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Баланс",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                        )),
                    Text("100 000 ₽",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        )),
                    SizedBox(height: 20),
                    Row(
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
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 70,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Color.fromRGBO(125, 153, 163, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn1.iconfinder.com/data/icons/money-bag-1/100/bag-ruble-256.png",
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
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
                          print('Нажата кнопка "Мои цели"!');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("До ближайшей цели",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                      child: LinearProgressIndicator(
                        minHeight: 10,
                        value: 0.75,
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      child: Text("10 000 ₽",
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
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CurrencyWidget(currency: currencies[index]),
                    if (index < currencies.length - 1) Divider(),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
