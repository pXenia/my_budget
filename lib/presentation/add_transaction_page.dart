import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';

import '../data/models/transaction_model.dart';


class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  String _transactionName = '';
  double _transactionCost = 0.0;
  bool _isIncome = false;
  DateTime _selectedDate = DateTime.now();

  final TransactionStore transactionStore = GetIt.instance<TransactionStore>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2d9ec),
      appBar: AppBar(
        backgroundColor: Color(0xffd2d9ec),
        title: Text(
          'Добавить транзакцию',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/personal_finance.png',
              width: double.infinity,
              height: 380,
              fit: BoxFit.cover,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Стоимость'),
                    keyboardType: TextInputType.number,
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
                      _transactionCost = double.parse(value!);
                    },
                  ),
                  DropdownButtonFormField<bool>(
                    decoration: InputDecoration(labelText: 'Тип'),
                    value: _isIncome,
                    items: const [
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
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Дата: ${_selectedDate}',
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Сохранить'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newTransaction = TransactionModel(
        id: transactionStore.nextId.toString(),
        name: _transactionName,
        date: _selectedDate,
        type: _isIncome,
        cost: _transactionCost,
      );

      await transactionStore.createTransaction(newTransaction);
      Navigator.pop(context);
    }
  }
}