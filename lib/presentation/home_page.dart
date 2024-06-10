import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  EdgeInsets.only(top: 120.0, left: 20, right: 20, bottom: 0),
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
                              width: 15,
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
                          // Ваш код, выполняемый при нажатии кнопки
                          print('Нажата кнопка "Мои цели"!');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("До ближайшей цели",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
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
            color: Colors.white, // Set the right half to white
          ),
        ),
      ],
    );
  }
}
