import 'package:flutter/material.dart';

class Currency {
  final String countryImage;
  final String currencyName;
  final double exchangeRate;

  Currency({
    required this.countryImage,
    required this.currencyName,
    required this.exchangeRate,
  });
}

class CurrencyWidget extends StatelessWidget {
  final Currency currency;

  CurrencyWidget({required this.currency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.network(
            currency.countryImage,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.currencyName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '1 ${currency.currencyName} = ${currency.exchangeRate} RUB',
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
