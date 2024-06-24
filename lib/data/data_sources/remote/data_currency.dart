import 'package:dio/dio.dart';

class CurrencyDataSource {
  final Dio dio;

  CurrencyDataSource(this.dio);

  Future<Map<String, dynamic>> getCurrency() async {
    final response = await dio.get('https://v6.exchangerate-api.com/v6/e7be26f5c918a80f5911ea77/latest/RUB');
    if (response.statusCode == 200) {
      return response.data['conversion_rates'];
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}