import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  String _transactionName = '';
  double _transactionAmount = 0.0;
  bool _isIncome = true;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить транзакцию'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Поле для ввода названия
              TextFormField(
                decoration: InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
                onSaved: (value) {
                  _transactionName = value!;
                },
              ),
              // Поле для ввода стоимости
              TextFormField(
                decoration: InputDecoration(labelText: 'Стоимость'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите стоимость';
                  }
                  try {
                    double.parse(value);
                  } catch (_) {
                    return 'Пожалуйста, введите правильное значение';
                  }
                  return null;
                },
                onSaved: (value) {
                  _transactionAmount = double.parse(value!);
                },
              ),
              // Dropdown для выбора доход или расход
              DropdownButtonFormField<bool>(
                decoration: InputDecoration(labelText: 'Тип транзакции'),
                value: _isIncome,
                items: [
                  DropdownMenuItem(
                    value: true,
                    child: Text('Доход'),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text('Расход'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _isIncome = value!;
                  });
                },
              ),
              // Выбор даты
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Text(
                      'Дата: ${_selectedDate.toLocal()}'.split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Выбрать дату'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Кнопка для сохранения формы
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newTransaction = Transaction(
                      isIncome: _isIncome,
                      name: _transactionName,
                      amount: _transactionAmount,
                      date: _selectedDate,
                    );
                    // Здесь можно сохранить новую транзакцию
                    print('Новая транзакция: ${newTransaction.name}, ${newTransaction.amount}, ${newTransaction.isIncome ? "Доход" : "Расход"}');
                    Navigator.pop(context);
                  }
                },
                child: Text('Добавить транзакцию'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Метод для выбора даты
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }
}

// Класс для хранения данных о транзакции
class Transaction {
  final bool isIncome;
  final String name;
  final double amount;
  final DateTime date;

  Transaction({
    required this.isIncome,
    required this.name,
    required this.amount,
    required this.date,
  });
}