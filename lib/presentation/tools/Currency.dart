import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/currency_model.dart';

class CurrencyWidget extends StatelessWidget {
  final Currency currency;

  CurrencyWidget({required this.currency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: currency.countryImage,
            width: 40,
            height: 40,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.currencyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
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